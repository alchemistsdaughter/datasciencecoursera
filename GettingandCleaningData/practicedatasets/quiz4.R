q2 <- gsub(",", "", dt_gdp$gdp) %>%
    as.numeric() %>%
    mean(na.rm = TRUE)