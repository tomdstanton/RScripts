remove_useless <- function(data, ...) {
  data |> 
    dplyr::select(dplyr::where(~dplyr::n_distinct(.x, ...) > 1)) |> 
    dplyr::select(!dplyr::where(~all(is.na(.x), ...)))
}
