#save the plot
save <- function() {
}
# make sure htmlwidgets:::toJSON() turns list() to {} in JSON, instead of []
.emptyList <- setNames(list(), character())
emptyList <- function()
  .emptyList

# merge two lists  by names,eg. x = list(a = 1, b = 2), mergeList(x, list(b =3)) => list(a = 1, b = 3)
# thanks for  yihuixie @rstudio
#' @export
mergeLists <- function (base_list, overlay_list, recursive = TRUE) {
  if (length(base_list) == 0)
    overlay_list
  else if (length(overlay_list) == 0)
    base_list
  else {
    merged_list <- base_list
    for (name in names(overlay_list)) {
      base <- base_list[[name]]
      overlay <- overlay_list[[name]]
      if (is.list(base) && is.list(overlay) && recursive)
        merged_list[[name]] <- mergeLists(base, overlay)
      else {
        merged_list[[name]] <- NULL
        merged_list <- append(merged_list,
                              overlay_list[which(names(overlay_list) %in% name)])
      }
    }
    merged_list
  }
}
####

