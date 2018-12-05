# ------------------------------------------------------------------------------

rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Rougheye/Blackspotted Rockfish Complex",
    area = c("^3C|^3D|^5A|^5B|^5C|^5D|^5E|^4B"),
    area_name = c("3CD5ABCDE4B"),
    skip_single_variable_models = FALSE,
    april1_year = FALSE,
    era = "modern"
  ),
  output_file = "rougheye-cpue-modern.html"
)

rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Rougheye/Blackspotted Rockfish Complex",
    area = c("^3C|^3D|^5A|^5B|^5C|^5D|^5E|^4B"),
    area_name = c("3CD5ABCDE4B"),
    skip_single_variable_models = FALSE,
    min_year_historic = 1978,
    april1_year = FALSE,
    era = "historic"
  ),
  output_file = "rougheye-cpue-historic.html"
)

# ------------------------------------------------------------------------------

flat_species <- c(
  "Arrowtooth Flounder",
  "English Sole",
  "Dover Sole",
  "Southern Rock Sole",
  "Petrale Sole"
)

to_filename <- function(x) {
  gfsynopsis:::clean_name(tolower(x))
}

for (spp_i in seq_along(flat_species)) {
  rmarkdown::render("cpue-report.Rmd",
    params = list(
      species_proper = flat_species[spp_i],
      area = c("5[CDE]+", "5[AB]+", "3[CD]+"),
      area_name = c("5CDE", "5AB", "3CD"),
      skip_single_variable_models = TRUE,
      era = "modern"
    ),
    output_file = paste0(to_filename(flat_species[spp_i]), "-cpue-modern.html")
  )
}

for (spp_i in seq_along(flat_species)) {
  rmarkdown::render("cpue-report.Rmd",
    params = list(
      species_proper = flat_species[spp_i],
      area = c("5[CDE]+", "5[AB]+", "3[CD]+"),
      area_name = c("5CDE", "5AB", "3CD"),
      skip_single_variable_models = TRUE,
      era = "historic"
    ),
    output_file = paste0(to_filename(flat_species[spp_i]), "-cpue-historic.html")
  )
}

# ------------------------------------------------------------------------------

rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Pacific Cod",
    area = c("5[ABCD]+", "3[CD]+"),
    area_name = c("5ABCD", "3CD"),
    april1_year = TRUE,
    era = "modern"
  ),
  output_file = "pacific-cod-cpue-modern.html"
)

rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Pacific Cod",
    area = c("5[ABCD]+", "3[CD]+"),
    april1_year = TRUE,
    era = "historic"
  ),
  output_file = "pacific-cod-cpue-historic.html"
)

###############
# historic:
now <- read.csv("data/generated/cpue-1996-predictions-pacific-cod-historic.csv", stringsAsFactors = FALSE) %>%
  filter(formula_version %in% c("Unstandardized", "Full standardization",
    "Full standardization minus interactions")) %>%
  select(-formula) %>%
  mutate(when = "now")

library(dplyr)
old <- readRDS("~/src/pcod-scenarios-2018/data/generated/cpue-1996-re-predictions-tweedie.rds")
old <- filter(old, formula_version %in% c("Unstandardized", "Full standardization")) %>%
  mutate(when = "old") %>%
  mutate(formula_version = gsub("Full standardization",
    "Full standardization minus interactions", formula_version)) %>%
  select(-formula)

check <- bind_rows(old, now)

library(ggplot2)
check %>%
  group_by(formula_version, model, area, when) %>%
  mutate(geo_mean = exp(mean(log(est)))) %>%
  mutate(upr = upr / geo_mean, lwr = lwr / geo_mean, est = est / geo_mean) %>%
  ungroup() %>%
  ggplot(aes(year, est, ymin = lwr, ymax = upr,
    colour = when, fill = when)) + geom_line() +
  geom_ribbon(alpha = 0.5) +
  facet_grid(formula_version~area) +
  ylab("CPUE (kg/hour) divided\nby geometric mean")


###############
# modern:
now <- read.csv("data/generated/cpue-1996-predictions-pacific-cod-modern.csv",
  stringsAsFactors = FALSE) %>%
  filter(formula_version %in% c("Unstandardized", "Full standardization",
    "Full standardization minus interactions")) %>%
  select(-formula) %>%
  mutate(when = "now")

library(dplyr)
old <- readRDS("~/Desktop/cpue-1996-re-predictions-tweedie.rds")
old <- filter(old, formula_version %in% c("Unstandardized", "Full standardization")) %>%
  mutate(when = "old") %>%
  mutate(formula_version = gsub("Full standardization",
    "Full standardization minus interactions", formula_version)) %>%
  select(-formula)

check <- bind_rows(old, now)

library(ggplot2)
check %>%
  group_by(formula_version, model, area, when) %>%
  mutate(geo_mean = exp(mean(log(est)))) %>%
  mutate(upr = upr / geo_mean, lwr = lwr / geo_mean, est = est / geo_mean) %>%
  ungroup() %>%
  ggplot(aes(year, est, ymin = lwr, ymax = upr,
    colour = when, fill = when)) + geom_line() +
  geom_ribbon(alpha = 0.5) +
  facet_grid(formula_version~area) +
  ylab("CPUE (kg/hour) divided\nby geometric mean")

