library(rmarkdown)

render("cpue-report.Rmd",
  params = list(
    species_proper = "Rougheye/Blackspotted Rockfish Complex",
    area = c("^3C|^3D|^5A|^5B|^5C|^5D|^5E|^4B"),
    area_name = c("3CD5ABCDE4B"),
    era = "modern"
  ),
  output_file = "rougheye-cpue-modern.html"
)

flat_species <- c(
  "Arrowtooth Flounder",
  "English Sole",
  "Dover Sole",
  "Southern Rock Sole",
  "Petrale Sole"
)

for (spp_i in seq_along(flat_species)) {
  render("cpue-report.Rmd",
    params = list(
      species_proper = flat_species[spp_i],
      area = c("5[CDE]+", "5[AB]+", "3[CD]+"),
      area_name = c("5CDE", "5AB", "3CD"),
      skip_single_variable_models = FALSE,
      era = "modern"
    ),
    output_file = paste0(
      gfsynopsis:::clean_name(tolower(flat_species[spp_i])),
      "-cpue-modern.html")
  )
}
