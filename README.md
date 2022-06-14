# Groundfish CPUE Reports

Requires the following R packages:

```r
pkgs <- c(
  "here", "glmmTMB", "ggplot2", "dplyr", "readr", "lubridate",
  "reshape2", "plyr", "purrr", "remotes"
)
install.packages(pkgs)

remotes::install_github("pbs-assess/gfplot")
remotes::install_github("pbs-assess/gfdata")
```

See examples in `make.R` to run a report.

Contact Sean Anderson for more details.

## Parameter descriptions

* `author`: Character: author name. Whatever you want.
* `species_proper`: Character: common name of species.
* `area`: R code regular expression for groundfish areas to include. For example: `!r c("^5A|^5B|^5C|^5D|^5E|^3C|^3D")` would filter for 5A or 5B or 5C etc. Can be a vector where each element would be processed as a separate series.
* `area_name`: R code for names of areas specified in previous argument (same length). E.g. `!r c("Coastwide")`.
* `skip_single_variable_models`: Logical: if `FALSE`, models with each individual predictor are run you understand their contributions. If `TRUE`, this is skipped to save time.
* `era`: Character: `"modern"` runs 1996 onwards. `"historical"` runs on data from `gfdata::get_cpue_historical()`, which includes data from `min_year_historic`--1995. The data go back to roughly 1955.
* `use_alt_year`: Logical: use alternative year starting date? If `FALSE`, uses January 1. If `TRUE`, uses `alt_year_start_date`.
* `alt_year_start_date`: Character: month and day of alternative year starting date. E.g. `"02-21"`.
* `min_year_historic`: Numeric: minimum year to filter if using the historical data. E.g. `1956`.
* `discard_only`: Logical: use only the discards for a discard-CPUE?
* `parallel`: Logical: parallel processing. Because the data are rather large you usually want to leave this as `FALSE`.
* `min_positive_tows`: Numeric: The minimum number of positive tows over all years. E.g. `140`.
*  `min_positive_trips`: Numeric: The minimum number of annual positive trips. E.g., `10`.
* `min_yrs_with_trips`: Numeric: The number of years in which the `min_positive_trips` criteria needs to be met. E.g., `5`.
* `final_year`: Numeric: Final year to include. E.g. `2021`.
* `final_date`: Character representing the final day to include: `"2021-12-31"`
* `depth_bin_quantiles`: R code representing minimal and maximum depth quantiles beyond which to discard fishing events. E.g. `!r c(0.001, 0.999)`. Set to `!r c(0, 1)` to not discard any fishing events based on extreme depths.
* `lat_range`: R code representing minimum and maximum values for latitude beyond which to discard fishing events. E.g. `!r c(48, Inf)`.
* `depth_range`: R code representing minimum and maximum depth values beyond which to discard fishing events. E.g. `!r c(-Inf, Inf)` to do nothing. `!r c(50, 350)` would only include fishing events `>=` 50 and `<=` 350.
