source('trash-cache.R')
env <- new.env(parent = baseenv())
library(here)

# ------------------------------------------------------------------------------

# 2021-03-24:
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Longspine Thornyhead",
    area = c("^3C|^3D|^5A|^5B|^5C|^5D|^5E|^4B"),
    area_name = c("3CD5ABCDE4B"),
    skip_single_variable_models = FALSE,
    april1_year = FALSE,
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
    april1_year = FALSE,
    era = "modern"
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
    april1_year = FALSE,
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
    april1_year = FALSE,
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
    april1_year = FALSE,
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

# --------------------------------------------------------------------------------

trash_cache('widow-rockfish', 'modern', '3CD5ABCDE')
rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Widow Rockfish",
    area = c("^3C|^3D|^5A|^5B|^5C|^5D|^5E"),
    area_name = c("3CD5ABCDE"),
    skip_single_variable_models = FALSE,
    april1_year = TRUE,
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
    april1_year = FALSE,
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
    april1_year = FALSE,
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
    april1_year = FALSE,
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
    april1_year = FALSE,
    era = "modern"
  ),
  output_file = "shortraker-rockfish-cpue-modern-coast.html"
)
