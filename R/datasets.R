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