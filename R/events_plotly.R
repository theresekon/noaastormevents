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
