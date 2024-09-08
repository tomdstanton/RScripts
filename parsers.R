## Define `hmmscan tblout` parsing function
read_hmmer_tblout <- function(path) {
  readr::read_lines(path) |>
    purrr::discard(~startsWith(.x, "#")) |>
    purrr::map_vec(~stringr::str_split(.x, "\\s+", n=19, simplify=TRUE)) |>
    tibble::as_tibble() |>
    dplyr::rename_with(~c(
        'target_name','target_accession','query_name','query_accession',
        'full_sequence_evalue',
        'full_sequence_score','full_sequence_bias','best_domain_evalue',
        'best_domain_score','best_domain_bias','exp','reg','clu','ov','env',
        'dom','rep','inc','description_of_target')) |>
    dplyr::mutate(
      dplyr::across(matches("_evalue$|_score$|_bias$|^exp$"), as.double),
      dplyr::across(all_of(c('reg','clu','ov','env','dom','rep','inc')), as.integer)
    )
}

## Define KOFAMSCAN output parsing function
read_kofamscan <- function(path) {
  readr::read_lines(path) |>
    purrr::discard(~startsWith(.x, "#")) |>
    purrr::map_vec(~stringr::str_split(.x, "\\s+", n=7, simplify=TRUE)) |>
    tibble::as_tibble() |>
    dplyr::rename_with(~c('below_threshold', 'protein','KO','threshold',
                          'score', 'evalue', 'KO_definition')) |>
    dplyr::mutate(dplyr::across(tidyselect::all_of(c(4, 5, 6)), as.double))
}
