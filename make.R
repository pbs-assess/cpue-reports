# ------------------------------------------------------------------------------

rmarkdown::render("cpue-report.Rmd",
  params = list(
    species_proper = "Rougheye/Blackspotted Rockfish Complex",
    area = c("^3C|^3D|^5A|^5B"),
    area_name = c("3CD5AB"),
    skip_single_variable_models = FALSE,
    april1_year = FALSE,
    era = "modern"
  ),
  output_file = "rougheye-cpue-modern-3CD5AB.html"
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
  output_file = "rougheye-cpue-modern-5DE.html"
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
  rm(d1996, dfleet, model)
  gc()
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
