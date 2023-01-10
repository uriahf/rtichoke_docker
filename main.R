library(plumber)

x <- plumb("plumber.R")
x$run(debug = TRUE, host = "0.0.0.0", port = 4242)


# Try Github Actions
