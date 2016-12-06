#' Map storm events for a date range using a plotly function
#'
#' This function creates an interactive map that shows all storm events listed
#' with a starting date within a specified date range. Regions with a specific
#' number of events may be highlighted or unhighlighted by clicking the
#' corresponding legends.
#'
#' @param east_only A logical value specifying whether to restrict the map to
#'    the eastern half of the United States (default is TRUE).
#' @param add_tracks A logical value specifying whether to add the tracks of
#'    a hurricane to the map (default = FALSE).
#' @param plot_type Specifies the type of plot wanted. It can be either "any
#'    events" or "number of events".
#' @inheritParams create_storm_data
#' @inheritParams adjust_storm_data
#'
#' @examples \dontrun{
#' events_plotly(date_range = c("1999-09-10", "1999-09-30"))
#' events_plotly(date_range = c("1999-09-01", "1999-09-30"),
#'    east_only = FALSE, event_type = c("Flood","Flash Flood"))
#' events_plotly(date_range = c("1999-09-10", "1999-09-30"),
#'    plot_type = "number of events")
#' events_plotly(date_range = c("1999-09-10", "1999-09-30"),
#'    dist_limit = 100, storm = "Floyd-1999",
#'    add_tracks = TRUE, plot_type = "number of events")
#' }
#'
#' @export
events_plotly <- function(date_range = NULL, event_type = NULL,
                          east_only = TRUE,
                          plot_type = "any events", dist_limit = NULL,
                          storm = NULL, add_tracks = FALSE) {
  plots <- map_events(date_range = date_range, event_type = event_type,
                      east_only = east_only, plot_type = plot_type,
                      dist_limit = dist_limit,
                      storm = storm, add_tracks = add_tracks)
  out <- ggplotly(p = ggplot2::last_plot(), tooltip = "all", layerData = 1, originalData = TRUE)
  return(out)
}
