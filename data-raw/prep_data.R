library(dplyr)
library(stringr)
library(tidyr)
library(readxl)
library(lubridate)


no2_raw_aqs <- read.csv("data-raw/daily_no2_17_031_4002_2021.csv") %>%
  filter(Parameter.Code == 42602,
         Pollutant.Standard == "NO2 1-hour 2010") %>%
  arrange(Day.In.Year..Local.) %>%
  mutate(parameter = "no2")

# ozone_raw_aqs <- read.csv("data-raw/daily_ozone_17_031_4002_2021.csv") %>%
#   filter(Parameter.Code == 44201) %>%
#   filter(Pollutant.Standard == "Ozone 1-hour 1979") %>%
#   arrange(Day.In.Year..Local.) %>%
#   mutate(parameter = "ozone")

pm25_raw_aqs <- read.csv("data-raw/daily_pm25_17_031_6005_2021.csv") %>%
  filter(Parameter.Name == "PM2.5 Raw Data",
         Duration.Description == "1 HOUR") %>%
  arrange(Day.In.Year..Local.) %>%
  mutate(parameter = "pm25")
  
so2_raw_aqs <- read.csv("data-raw/daily_so2_17_031_0076_2021.csv") %>%
  filter(Parameter.Name == "Sulfur dioxide",
         Pollutant.Standard == "SO2 1-hour 2010") %>%
  arrange(Day.In.Year..Local.) %>%
  mutate(parameter = "so2",
         AQI = as.character(AQI))

chicago_aqs <- bind_rows(no2_raw_aqs, #ozone_raw_aqs,
                             pm25_raw_aqs, so2_raw_aqs) %>%
  distinct() %>%
  group_by(State.Code, County.Code, Site.Number, Parameter.Code) %>%
  filter(POC == min(POC)) %>%
  ungroup()

names(chicago_aqs) <- gsub("\\.", "_", names(chicago_aqs))
names(chicago_aqs) <- gsub("__", "_", names(chicago_aqs))
names(chicago_aqs) <- gsub("_$", "", names(chicago_aqs))

chicago_daily <- chicago_aqs %>%
  transmute(parameter,
            date = Date_Local,
            value = First_Maximum_Value) %>%
  pivot_wider(names_from = parameter, values_from = value)
  
chicago_aqs <- chicago_aqs %>%
  select(-parameter)

emissions_unit <- read_excel("data-raw/emissions_IL_2022.xlsx",
                             sheet = "UNIT_DATA",
                             skip = 6)

emissions_fuel <- read_excel("data-raw/emissions_IL_2022.xlsx",
                             sheet = "FUEL_DATA",
                             skip = 6)

################## chicago_air #################################################


ozone <- readr::read_csv("data-raw/daily_ozone_17_023_0001_2021.csv") %>%
  group_by(`Date Local`) %>%
  summarize(ozone = max(`1st Max Value`))

temp <- readr::read_csv("data-raw/daily_temp_17_023_0001_2021.csv") %>%
  group_by(`Date Local`) %>%
  summarize(temp = max(`1st Max Value`))

pressure <- readr::read_csv("data-raw/daily_press_17_023_0001_2021.csv") %>%
  group_by(`Date Local`) %>%
  summarize(pressure = max(`1st Max Value`))


chicago_air <- ozone %>%
  full_join(temp) %>%
  full_join(pressure) %>%
  transmute(date = `Date Local`,
            ozone,
            temp,
            pressure,
            month = lubridate::month(date),
            weekday = wday(date)) %>%
  arrange(date)
  
  


################################################################################

aqs_parameters <- readr::read_csv("data-raw/parameters.csv")
names(aqs_parameters) <- gsub(" ", "_", names(aqs_parameters))


################################################################################

# load chicago_ozone_hourly and chicago_wind_hourly
load("data-raw/hourly_ozone_17_031_4201_2021.rda")
load("data-raw/hourly_wind_17_031_4201_2021.rda")

wind_hourly <- chicago_wind_hourly %>%
  transmute(datetime = as.POSIXct(paste(`Date Local`, `Time Local`),
                                  tz = "CST6CDT"),
            parameter = tolower(`Parameter Name`),
            parameter = sub(" - resultant", "", parameter),
            parameter = sub(" ", "_", parameter),
            value = `Sample Measurement`) %>%
  pivot_wider(names_from = parameter, values_from = value)
  
ozone_hourly <- chicago_ozone_hourly %>%
  mutate(datetime = as.POSIXct(paste(`Date Local`, `Time Local`),
                                  tz = "CST6CDT")) %>%
  group_by(datetime) %>%
  filter(POC == 1) %>%
  summarise(ozone = mean(`Sample Measurement`))

chicago_wind <- wind_hourly %>%
  left_join(ozone_hourly, "datetime") %>%
  as.data.frame()

################################################################################

# ertac_egu_projections <- read_excel("data-raw/ERTAC_2022_2038.xlsx", sheet = "2038-4")

# write.csv(ertac_egu_projections, "data-raw/ertac_2022_2038.csv", row.names = FALSE)

# manually changed the column names in the csv file

ertac_egu_projections <- readr::read_csv("data-raw/ertac_2022_2038.csv")
  

################################################################################


usethis::use_data(chicago_aqs, aqs_parameters, chicago_daily, emissions_unit,
                  emissions_fuel, chicago_air, chicago_wind, ertac_egu_projections,
                  overwrite = TRUE)

