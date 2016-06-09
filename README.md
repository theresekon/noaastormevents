
<!-- README.md is generated from README.Rmd. Please edit that file -->
Loading the package
-------------------

The package currently exists in [a development version](https://github.com/zailchen/noaastormevents) on GitHub. You can use the following code to load it:

``` r
library(devtools)
install_github("zailchen/noaastormevents")
library(noaastormevents)
```

As a caveat, however, this package is in early development and relies on other packages that are in development on GitHub, so it may take some doing to get the package set up at the moment.

Simple example
--------------

This package can be used to explore and map data from [NOAA's Storm Events Database](https://www.ncdc.noaa.gov/stormevents/). We are currently developing the package using only data from a single year, 1999.

The storm has a number of functions for mapping different data points from this database. For example, the `map_events` function allows you to map all events in the database with a starting date within a specified range. It also has some options specific to tropical storm research, including mapping only events with tropical storm-related tags or only events that happened in counties within a certain distance of the track of a specific tropical storm.

Here are some examples:

Mapping all counties that had at least one event over a date range:

``` r
map_events(first_date = "1999-10-15", last_date = "1999-10-20")
```

![](README-unnamed-chunk-3-1.png)

Mapping any county with at least one tropical storm-related event, not restricting to only the eastern half of the country:

``` r
map_events(first_date = "1999-10-16", last_date = "1999-10-18",
    east_only = FALSE, ts_only = TRUE)
```

![](README-unnamed-chunk-4-1.png)

Mapping the number of events in each county within a certain date range:

``` r
map_events(first_date = "1999-10-16", last_date = "1999-10-18",
    plot_type = "number of events")
```

![](README-unnamed-chunk-5-1.png)

Mapping the number of events, but only counting counties that were within 100 kilometers of the track of Hurricane Floyd in 1999, with the hurricane's track added to the plot:

``` r
map_events(first_date = "1999-10-16", last_date = "1999-10-18",
    dist_limit = 100, storm = "Floyd-1999",
     add_tracks = TRUE, plot_type = "number of events")
```

![](README-unnamed-chunk-6-1.png)