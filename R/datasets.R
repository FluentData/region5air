#' Air quality data from a Chicago monitor.
#'
#' A dataset containing daily values of ozone, temperature, and barometric pressure from a Chicago monitor between
#' January 1, 2021 and December 31, 2021.
#'
#' @format A data frame with 730 rows and 6 variables:
#' \describe{
#'   \item{date}{Year-Month-Day}
#'   \item{ozone}{8-hour maximum value in ppm}
#'   \item{temp}{1-hour maximum value in degrees Fahrenheit}
#'   \item{pressure}{1-hour maximum value in Millibars}
#'   \item{month}{Month (1-12)}
#'   \item{weekday}{Day of week (1-7)}
#' }
#' @details These are measurements from a monitor with EPA AQS code 17023001 at latitude 39.21086 and longitude -87.6683,
#' datum WGS84.
#' @source \url{https://aqs.epa.gov/aqsweb/airdata/download_files.html}
"chicago_air"

#' Air quality data from AQS
#' @format A data frame with 1009 rows and 34 columns:
#' \describe{
#'   \item{State_Code}{Code for the state where the monitor is located}
#'   \item{County_Code}{Code for the county where the monitor is located}
#'   \item{Site_Number}{Numer identifying a particular site in a county}
#'   \item{Parameter_Code}{Code identifying what is being measured}
#'   \item{POC}{“Parameter Occurrence Code” used to distinguish different instruments that measure the same parameter at the same site}
#'   \item{Latitude}{Latitude of the monitor location}
#'   \item{Longitude}{Longitude of the monitor location}
#'   \item{Datum}{The Datum associated with the Latitude and Longitude measures}
#'   \item{Parameter_Name}{Name of the parameter}
#'   \item{Duration_Description}{the length of time used to acquire a sample measurement}
#'   \item{Pollutant_Standard}{The Air Quality Standard applicable to the measurement}
#'   \item{Date_Local}{Date of the measurement}
#'   \item{Year}{Year of the measurement}
#'   \item{Day_In_Year_Local}{Day of the year}
#'   \item{Units_of_Measure}{Unit}
#'   \item{Exceptional_Data_Type}{Flag for exceptional events}
#'   \item{Nonreg_Observation_Count}
#'   \item{Ovservation_Count}
#'   \item{Observation_Percent}
#'   \item{Nonreg_Arithmetic_Mean}
#'   \item{Arithmetic_Mean}
#'   \item{Nonreg_First_Maximum_Value}
#'   \item{First_Maximum_Value}
#'   \item{First_Maximum_Hour}
#'   \item{AQI}
#'   \item{Daily_Criteria_Indicator}
#'   \item{Tribe_Name}
#'   \item{State_Name}
#'   \item{County_Name}
#'   \item{City_Name}
#'   \item{Local_Site_Name}
#'   \item{Address}
#'   \item{MSA_or_CBSA_Name}
#'   \item{Data_Source}
#' }
#' 
#' @source \url{https://aqs.epa.gov/aqsweb/airdata/download_files.html}
"chicago_aqs"

#' Table of parameter information from AQS.
#'
#'
#' @format A data frame with 1477 rows and 8 variables:
#' \describe{
#'   \item{Parameter_Code}{5 digit numeric code}
#'   \item{Parameter}{Chemical description}
#'   \item{Parameter Abbreviation}{Abbreviation}
#'   \item{Parameter_Alternate_Name}{Common alternative chemical name}
#'   \item{CAS_Number}{Chemical Abstract Service number}
#'   \item{Standard_Units}{Standard unit of measurement}
#'   \item{Still_Valid}{Still valid as an AQS parameter}
#'   \item{Round_or_Truncate}{Is the value in the AQS database rounded or truncated}
#' }
#' @source \url{https://aqs.epa.gov/aqsweb/documents/codetables/parameters.html}
"aqs_parameters"

#' Wind speed, direction, and ozone from a Chicago monitor
#' 
#' @format A data frame with 4834 rows and 4 variables:
#' \describe{
#'   \item{datetime}{Date and hour of measurement}
#'   \item{wind_speed}{Resultant wind speed in knots}
#'   \item{wind_direction}{Resultant wind direction in degrees}
#'   \item{ozone}{Ozone concentration in parts per million}
#'}
#' @source \url{https://aqs.epa.gov/aqsweb/airdata/download_files.html}
"chicago_aqs"

#' ERTAC EGU Air Emissions Projections
#'
#' A dataset containing projected air emissions data for Electric Generating Units (EGUs) within the ERTAC region, 
#' including details such as facility name, location, fuel type, generation capacity, and projected annual emissions 
#' rates for SO2 and NOx for the years 2022 and 2038.
#'
#' @format A data frame with 80,551 rows and 18 variables:
#' \describe{
#'   \item{oris_code}{(integer) ORIS Plant Code, a unique identifier for power plants in the United States.}
#'   \item{unit_id}{(character) Identifier for each unit within a plant.}
#'   \item{facility_name}{(character) Name of the power generation facility.}
#'   \item{state}{(character) US state where the facility is located.}
#'   \item{fips_code}{(character) Federal Information Processing Standard code for the county.}
#'   \item{ertac_region}{(character) ERTAC region code indicating the regional grouping for analysis.}
#'   \item{fuel_type}{(character) Type of fuel used for power generation (e.g., Coal, Gas).}
#'   \item{gen_capacity_mw}{(numeric) Generation capacity of the unit in megawatts.}
#'   \item{annual_so2_2022_tons}{(numeric) Projected annual SO2 emissions in tons for the year 2022.}
#'   \item{avg_annual_so2_rate_2022}{(numeric) Projected average annual SO2 emissions rate in pounds per million British thermal units (lbs/MMBtu) for 2022.}
#'   \item{annual_nox_2022_tons}{(numeric) Projected annual NOx emissions in tons for the year 2022.}
#'   \item{avg_annual_nox_rate_2022}{(numeric) Projected average annual NOx emissions rate in pounds per million British thermal units (lbs/MMBtu) for 2022.}
#'   \item{annual_so2_2038_tons}{(numeric) Projected annual SO2 emissions in tons for the year 2038.}
#'   \item{avg_annual_so2_rate_2038}{(numeric) Projected average annual SO2 emissions rate in pounds per million British thermal units (lbs/MMBtu) for 2038.}
#'   \item{annual_nox_2038_tons}{(numeric) Projected annual NOx emissions in tons for the year 2038.}
#'   \item{avg_annual_nox_rate_2038}{(numeric) Projected average annual NOx emissions rate in pounds per million British thermal units (lbs/MMBtu) for 2038.}
#'   \item{longitude}{(numeric) Longitude of the facility location.}
#'   \item{latitude}{(numeric) Latitude of the facility location.}
#' }
#' @details The dataset is intended for use by researchers and policymakers to analyze future emissions scenarios and 
#' to plan for regulatory compliance and environmental impact assessments.
#' @source \url{https://www.epa.gov/air-emissions-inventories/eastern-regional-technical-advisory-committee-ertac-electricity}
"ertac_egu_projections"