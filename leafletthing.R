install.packages("leaflet")

library(leaflet)
my_map <- leaflet() %>%
    addTiles()

my_map

my_map <- my_map %>%
    addMarkers(lat=39.298, lng=-76.589,
               popup="Jeff Leek's Options")
my_map

set.seed(2016-04-25)
df <- data.frame(lat = runif(20,min = 39.2, max=39.3),
                 lng = runif(20, min=-76.6, max=-76.5))

df %>%
    leaflet() %>%
    addTiles() %>%
    addMarkers()


hopkinsIcon <- makeIcon(
    iconUrl = "http://brand.jhu.edu/content/uploads/2014/06/university.shield.small_.blue_.png",
    iconWidth = 31*215/230, iconHeight = 31,
    iconAnchorX = 31*215/230/2, iconAnchorY = 16
)

df %>%
    leaflet() %>%
    addTiles() %>%
    addMarkers(icon=hopkinsIcon)

##popup = hopkinsSites <- c("<a href="....">SomeText</a>, ...)


df <- data.frame(lat = runif(500,min = 39.2, max=39.3),
                 lng = runif(500, min=-76.6, max=-76.5))

df %>%
    leaflet() %>%
    addTiles() %>%
    addMarkers(clusterOptions = markerClusterOptions())


df %>%
    leaflet() %>%
    addTiles() %>%
    addCircleMarkers()


md_cities <- data.frame(name = c("Balt","Frederick", "Rock","Bowie","Anna"),
                        pop=c(62000,66000,61000,39000,30000),
                        lat =c(39.2, 39.4, 39.1,39.1,40),
                        lng = c(-76.6, -77.4, -77.15, -77.2, -77))
md_cities %>%
    leaflet() %>%
    addTiles() %>%
    addCircles(weight = 1, radius=sqrt(md_cities$pop)*30)

leaflet() %>%
    addTiles %>%
    addRectangles(lat1=37,lng1 = -122,
                  lat2=38, lng2 = -123)

df <- data.frame(lat = runif(20,min = 39.2, max=39.3),
                 lng = runif(20, min=-76.6, max=-76.5),
                 col = sample(c("red","blue","green"), 20, replace = T), stringsAsFactors = F
                 )

df %>%
    leaflet() %>%
    addTiles() %>%
    addCircleMarkers(color=df$col) %>%
    addLegend(labels=LETTERS[1:3], colors = c("blue","red","green"))
