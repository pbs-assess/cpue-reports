plot_re_predictions <- function(dat, model_version = "Combined", scale = FALSE) {

  if (scale) {
    dat <- dat %>% group_by(formula_version, model, area) %>%
      mutate(geo_mean = exp(mean(log(est)))) %>%
      mutate(upr = upr/geo_mean, lwr = lwr/geo_mean, est = est/geo_mean) %>%
      ungroup()
  }

  unstandardized <- dat %>%
    filter(formula_version == "Unstandardized") %>%
    rename(est_unstandardized = est, lwr_unstandardized = lwr, upr_unstandardized = upr) %>%
    select(year, area, model, est_unstandardized, lwr_unstandardized, upr_unstandardized)

  temp <- dat %>%
    filter(formula_version != "Unstandardized") %>%
    left_join(unstandardized, by = c("area", "year", "model")) %>%
    filter(model == model_version) %>%
    mutate(formula_version = gsub("\\+ ", " ", formula_version)) %>%
    mutate(formula_version =
        gsub("Full standardization", "All variables", formula_version)) %>%
    mutate(formula_version =
        forcats::fct_relevel(formula_version, "All variables", after = Inf))
  temp %>%
    ggplot(aes(year, est, ymin = upr, ymax = lwr)) +
    geom_line(aes(y = est_unstandardized), colour = "grey30", lty = 1) +
    ggplot2::geom_ribbon(
      aes(ymin = lwr_unstandardized, ymax = upr_unstandardized),
      fill = "#00000030") +
    ggplot2::geom_ribbon(alpha = 0.4, fill = "red") +
    geom_line(colour = "red") +
    theme_pbs() +
    facet_grid(area~formula_version, scales = "free_y") +
    labs(y = if (!scale) "CPUE (kg/hour)" else "CPUE (kg/hour) divided\nby geometric mean",
      x = "") +
    ylim(0, NA) +
    guides(colour = FALSE, fill = FALSE)
}

bubble_predictors <- function(dat, variable, reorder_group = FALSE,
  group_id = "fishing_event_id", ncol = 2) {
  temp <- dat %>%
    filter(spp_catch > 0) %>%
    group_by(area, year, !!rlang::sym(variable)) %>%
    summarize(n = length(unique(!!rlang::sym(group_id)))) %>%
    group_by(area, !!rlang::sym(variable)) %>%
    mutate(n_tot = sum(n)) %>%
    ungroup()

  if (reorder_group) {
    temp[, variable] <- paste(temp$area,
      as.character(temp[, variable,drop=TRUE]))
    temp$y_group <- forcats::fct_reorder2(temp[, variable, drop=TRUE],
      temp$area, -temp$n_tot)
  } else {
    temp$y_group <- temp[, variable, drop=TRUE]
  }

  temp %>%
    ggplot(aes_string("as.factor(year)", y = "y_group")) +
    geom_point(aes(size = n, fill = n), alpha = 0.4, pch = 21) +
    facet_wrap(~area, scales = "free", ncol = ncol) +
    scale_x_discrete(breaks = seq(1950, 2020, 10)) +
    xlab("") + ylab(gfplot:::firstup(gsub("_", " ", variable))) +
    labs(size = "Number of trips") +
    labs(fill = "Number of trips") +
    scale_size_continuous(range = c(0, 7)) +
    scale_fill_viridis_c(trans = "log", breaks = c(1, 10, 100, 500))
}

plot_pcod_dist <- function(dat, y, ylab = "", title = "") {
  ggplot(dat, aes_string("as.factor(year)", y = y)) +
    geom_boxplot(outlier.size = 0.3, outlier.alpha = 0.5) +
    scale_y_log10(breaks = c(0.1, 1, 10, 100, 1000, 10000),
      labels = scales::comma) +
    scale_x_discrete(breaks = seq(1950, 2030, 5)) +
    theme_pbs() +
    theme(axis.text.x = element_text(angle = 90, vjust = 0.5)) +
    facet_wrap(~area) + xlab("") + ylab(ylab) +
    ggtitle(title)
}
