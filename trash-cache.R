trash_cache <- function(species, era, area) {
  f <- list.files('.', recursive = TRUE)
  f_species <- grep(species, f)
  f_era <- grep(era, f)
  f_area <- grep(area, f)
  to_remove <- intersect(intersect(f_species, f_era), f_area)
  file.remove(f[to_remove])
}
