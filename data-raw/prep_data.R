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

chicago_aqs_raw <- bind_rows(no2_raw_aqs, #ozone_raw_aqs,
                             pm25_raw_aqs, so2_raw_aqs) %>%
  distinct() %>%
  group_by(State.Code, County.Code, Site.Number, Parameter.Code) %>%
  filter(POC == min(POC)) %>%
  ungroup()

names(chicago_aqs_raw) <- gsub("\\.", "_", names(chicago_aqs_raw))
names(chicago_aqs_raw) <- gsub("__", "_", names(chicago_aqs_raw))
names(chicago_aqs_raw) <- gsub("_$", "", names(chicago_aqs_raw))

chicago_daily <- chicago_aqs_raw %>%
  transmute(parameter,
            date = Date_Local,
            value = First_Maximum_Value) %>%
  pivot_wider(names_from = parameter, values_from = value)
  
chicago_aqs_raw <- chicago_aqs_raw %>%
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


usethis::use_data(chicago_aqs_raw, chicago_daily, emissions_unit,
                  emissions_fuel, chicago_air, overwrite = TRUE)
