source('trash-cache.R')
env <- new.env(parent = baseenv())
library(here)

# 2022-06-09:

rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Canary Rockfish",
    area = c("^5A|^5B|^5C|^5D|^5E|^3C|^3D"),
    area_name = c("3CD5ABCDE"),
    skip_single_variable_models = FALSE,
    use_alt_year = FALSE,
    era = "modern",
    discard_only = FALSE,
    final_year = 2021,
    final_date = "2021-12-31",
    min_positive_trips = 10,
    min_yrs_with_trips = 5,
    min_positive_tows = 140,
    depth_bin_quantiles = c(0, 1),
    depth_range = c(50, 350),
    final_date = "2021-12-31"
  ),
  output_file = "canary-rockfish-cpue-modern-3CD5ABCDE-10-5-140.html"
)


rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Canary Rockfish",
    area = c("^5A|^5B|^5C|^5D|^5E|^3C|^3D"),
    area_name = c("3CD5ABCDE"),
    skip_single_variable_models = FALSE,
    use_alt_year = FALSE,
    era = "historical",
    discard_only = FALSE,
    final_year = 2021,
    min_positive_trips = 10,
    min_yrs_with_trips = 5,
    min_positive_tows = 100,
    depth_bin_quantiles = c(0, 1),
    # lat_range = c(48, 56),
    depth_range = c(50, 350),
    final_date = "2021-12-31"
  ),
  output_file = "canary-rockfish-cpue-historical-3CD5ABCDE-10-5-100-2.html"
)


# 2022-03-15
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Canary Rockfish",
    area = c("^5A|^5B|^5C|^5D|^5E|^3C|^3D"),
    area_name = c("3CD5ABCDE"),
    skip_single_variable_models = FALSE,
    use_alt_year = FALSE,
    discard_only = FALSE,
    era = "modern",
    final_year = 2021,
    min_positive_trips = 10,
    min_yrs_with_trips = 5,
    min_positive_tows = 100,
    depth_bin_quantiles = c(0, 1),
    # lat_range = c(48, 56),
    depth_range = c(50, 350),
    final_date = "2021-12-31"
  ),
  output_file = "canary-rockfish-cpue-modern-3CD5ABCDE-10-5-100-2.html"
)


# 2021-06-30
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Yellowmouth Rockfish",
    area = c("^5A|^5B|^5C|^5D|^5E|^3C|^3D"),
    area_name = c("3CD5ABCDE"),
    skip_single_variable_models = FALSE,
    use_alt_year = FALSE,
    discard_only = FALSE,
    era = "modern",
    final_year = 2020,
    min_positive_trips = 10,
    min_yrs_with_trips = 5,
    min_positive_tows = 100,
    depth_bin_quantiles = c(0, 1),
    lat_range = c(48, 56),
    depth_range = c(100, 425)
  ),
  output_file = "yellowmouth-rockfish-cpue-modern-3CD5ABCDE-10-5-100.html"
)

trash_cache('arrowtooth-flounder', 'modern', '3CD5ABCDE')
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Arrowtooth Flounder",
    area = c("^5A|^5B|^5C|^5D|^5E|^3C|^3D"),
    area_name = c("3CD5ABCDE"),
    skip_single_variable_models = TRUE,
    use_alt_year = FALSE,
    alt_year_start_date = "02-21",
    final_year = 2021,
    final_date = "2021-07-26",
    discard_only = TRUE,
    era = "modern"
  ),
  output_file = "arrowtooth-flounder-cpue-modern-3CD5ABCDE-discard-only-jan-1.html"
)

# 2021-06-15
trash_cache('arrowtooth-flounder', 'modern', '3CD5ABCDE')
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Arrowtooth Flounder",
    area = c("^5A|^5B|^5C|^5D|^5E|^3C|^3D"),
    area_name = c("3CD5ABCDE"),
    skip_single_variable_models = TRUE,
    use_alt_year = TRUE,
    alt_year_start_date = "02-21",
    final_year = 2021,
    final_date = "2021-07-26",
    discard_only = TRUE,
    era = "modern"
  ),
  output_file = "arrowtooth-flounder-cpue-modern-3CD5ABCDE-discard-only.html"
)

# 2021-06-16:
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Arrowtooth Flounder",
    area = c("^5C|^5D"),
    area_name = c("5CD"),
    skip_single_variable_models = TRUE,
    use_alt_year = TRUE,
    discard_only = TRUE,
    era = "modern"
  ),
  output_file = "arrowtooth-flounder-cpue-modern-5CD-discard-only.html"
)

# 2021-06-15:
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Arrowtooth Flounder",
    area = c("^5A|^5B|^5C|^5D|^5E|^3C|^3D"),
    area_name = c("3CD5ABCDE"),
    skip_single_variable_models = TRUE,
    use_alt_year = TRUE,
    era = "modern"
  ),
  output_file = "arrowtooth-flounder-cpue-modern-3CD5ABCDE.html"
)

# 2021-06-15:
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Arrowtooth Flounder",
    area = c("^5E"),
    area_name = c("5E"),
    skip_single_variable_models = TRUE,
    use_alt_year = TRUE,
    era = "modern"
  ),
  output_file = "arrowtooth-flounder-cpue-modern-5E.html"
)

# 2021-06-15:
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Arrowtooth Flounder",
    area = c("^5C|^5D"),
    area_name = c("5CD"),
    skip_single_variable_models = TRUE,
    use_alt_year = TRUE,
    era = "modern"
  ),
  output_file = "arrowtooth-flounder-cpue-modern-5CD.html"
)

# 2021-06-15:
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Arrowtooth Flounder",
    area = c("^5A|^5B"),
    area_name = c("5AB"),
    skip_single_variable_models = TRUE,
    use_alt_year = TRUE,
    era = "modern"
  ),
  output_file = "arrowtooth-flounder-cpue-modern-5AB.html"
)

# 2021-04-23:
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Arrowtooth Flounder",
    area = c("^5A|^5B|^5C|^5D|^5E"),
    area_name = c("5ABCDE"),
    skip_single_variable_models = FALSE,
    use_alt_year = TRUE,
    era = "modern"
  ),
  output_file = "arrowtooth-flounder-cpue-modern-5ABCDE.html"
)

# 2021-04-23:
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Arrowtooth Flounder",
    area = c("^3C|^3D"),
    area_name = c("3CD"),
    skip_single_variable_models = FALSE,
    use_alt_year = TRUE,
    era = "modern"
  ),
  output_file = "arrowtooth-flounder-cpue-modern-3CD.html"
)

# 2021-03-24:
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Longspine Thornyhead",
    area = c("^3C|^3D|^5A|^5B|^5C|^5D|^5E|^4B"),
    area_name = c("3CD5ABCDE4B"),
    skip_single_variable_models = FALSE,
    use_alt_year = FALSE,
    era = "modern"
  ),
  output_file = "longspine-thornyhead-cpue-modern-3CD5ABCDE4B.html"
)

# 2021-03-24:
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Longspine Thornyhead",
    area = c("^3C|^3D"),
    area_name = c("3CD"),
    skip_single_variable_models = FALSE,
    use_alt_year = FALSE,
    era = "modern",
    final_year = 2020
  ),
  output_file = "longspine-thornyhead-cpue-modern-3CD.html"
)

# 2021-03-24:
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Longspine Thornyhead",
    area = c("^3C|^3D"),
    area_name = c("3CD"),
    skip_single_variable_models = FALSE,
    use_alt_year = FALSE,
    era = "modern",
    final_year = 2020
  ),
  output_file = "longspine-thornyhead-cpue-modern-3CD.html"
)



trash_cache('rougheye', 'modern', '5DE')
trash_cache('rougheye', 'modern', '3CD5AB')
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Rougheye/Blackspotted Rockfish Complex",
    area = c("^3C|^3D|^5A|^5B"),
    area_name = c("3CD5AB"),
    skip_single_variable_models = FALSE,
    use_alt_year = FALSE,
    era = "modern"
  ),
  output_file = "rougheye-cpue-modern-3CD5AB.html",
  envir = env
)

rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Rougheye/Blackspotted Rockfish Complex",
    area = c("^5D|^5E"),
    area_name = c("5DE"),
    skip_single_variable_models = FALSE,
    use_alt_year = FALSE,
    era = "modern"
  ),
  output_file = "rougheye-cpue-modern-5DE.html",
  envir = env
)


rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Rougheye/Blackspotted Rockfish Complex",
    area = c("^3C|^3D|^5A|^5B|^5C|^5D|^5E|^4B"),
    area_name = c("3CD5ABCDE4B"),
    skip_single_variable_models = FALSE,
    min_year_historic = 1978,
    use_alt_year = FALSE,
    era = "historic"
  ),
  output_file = "rougheye-cpue-historic.html",
  envir = env
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
    output_file = paste0(to_filename(flat_species[spp_i]), "-cpue-modern.html"),
    envir = env
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
    output_file = paste0(to_filename(flat_species[spp_i]), "-cpue-historic.html"),
    envir = env
  )
}

# ------------------------------------------------------------------------------

rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Pacific Cod",
    area = c("5[ABCD]+", "3[CD]+"),
    area_name = c("5ABCD", "3CD"),
    use_alt_year = TRUE,
    era = "modern"
  ),
  output_file = "pacific-cod-cpue-modern.html"
)

rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Pacific Cod",
    area = c("5[ABCD]+", "3[CD]+"),
    use_alt_year = TRUE,
    era = "historic"
  ),
  output_file = "pacific-cod-cpue-historic.html"
)

# --------------------------------------------------------------------------------

trash_cache('widow-rockfish', 'modern', '3CD5ABCDE')
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Widow Rockfish",
    area = c("^3C|^3D|^5A|^5B|^5C|^5D|^5E"),
    area_name = c("3CD5ABCDE"),
    skip_single_variable_models = FALSE,
    use_alt_year = TRUE,
    era = "modern",
    parallel = TRUE
  ),
  output_file = "widow-rockfish-3CD5ABCDE-cpue-modern.html"
)

# --------------------------------------------------------------------------------

rmarkdown::render("cpue-report-pjs.Rmd",
  params = list(
    file = "~/Downloads/wwr_totBC.csv",
    species_proper = "Widow Rockfish",
    area_name = c("3CD5ABCDE"),
    skip_single_variable_models = FALSE,
    era = "modern",
    parallel = TRUE
  ),
  output_file = "widow-rockfish-3CD5ABCDE-cpue-modern-pjs.html"
)

# -----------------------

rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Shortraker Rockfish",
    area = c("^5C|^5D|^5E"),
    area_name = c("5CDE"),
    skip_single_variable_models = FALSE,
    min_year_historic = 1980,
    use_alt_year = FALSE,
    era = "historic"
  ),
  output_file = "shortraker-rockfish-cpue-historical-5CDE.html"
)


rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Shortraker Rockfish",
    area = c("^5C|^5D|^5E"),
    area_name = c("5CDE"),
    skip_single_variable_models = FALSE,
    min_year_historic = 1980,
    use_alt_year = FALSE,
    era = "modern"
  ),
  output_file = "shortraker-rockfish-cpue-modern-5CDE.html"
)

rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Shortraker Rockfish",
    area = c("^3C|^3D|^5A|^5B|^5C|^5D|^5E"),
    area_name = c("3CD5ABCDE"),
    skip_single_variable_models = FALSE,
    min_year_historic = 1978,
    use_alt_year = FALSE,
    era = "historic"
  ),
  output_file = "shortraker-rockfish-cpue-historical-coast.html"
)


rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Shortraker Rockfish",
    area = c("^3C|^3D|^5A|^5B|^5C|^5D|^5E"),
    area_name = c("3CD5ABCDE"),
    skip_single_variable_models = FALSE,
    min_year_historic = 1978,
    use_alt_year = FALSE,
    era = "modern"
  ),
  output_file = "shortraker-rockfish-cpue-modern-coast.html"
)
