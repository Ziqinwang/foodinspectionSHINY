# Chicago Food Inspection Browser

This application is an example of a dashboard that can visualize food inspection result in Chicago. The dashboard includes the following features:

1. An interactive map of Chicago including:
  - Clustered food inspection events
  - Popup text for each event with risk level
2. Widgets that provide aggregate summaries of food inspection events.
3. A calendar that allows the user to filter food inspection events by date. This calendar
is consistent throughout the app.
4. Visualizations of food inspection result over time and by type of crime.

The following R Packages were used to prepare the data for this app:

- dplyr
- lubridate
- readr
- magrittr
- stringr
- purrr

The following R Packages are used to render this app:

- shiny
- shinydashboard
- dplyr
- leaflet
- ggplot2
- lubridate



```
shiny::runGitHub("seankross/Baltimore_Crime_Browser")
```
