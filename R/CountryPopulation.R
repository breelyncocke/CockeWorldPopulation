#' Country Population as a Plot
#'
#'This function will output a plot of a country's population in thousands for a timespan from
#'1950 to 2020. The input of the function must be inputted as a character string
#'with quotations around the name of the country of interest. The data is taken from
#'the World_Population excel file in this package.
#'
#' @param country_name A name of a country as a string
#' @return plot of year versus country population (in thousands)
#' @examples
#' CountryPopulation("United States of America")
#' CountryPopulation("China")
#' @export


CountryPopulation = function(country_name){
  country_data = WorldPopulation[WorldPopulation$CountryName == country_name, ]
  if (nrow(country_data) == 0){
    stop("Country input invalid")
  }
  Population = country_data[, 3]
  Year = country_data[, 2]
  Year = as.vector(Year)
  Population = as.vector(Population)

  plot_data = data.frame(Year, Population)

  ggplot(plot_data, aes(x=Year, y=Population)) +
    geom_line() +
    labs( title= country_name) +
    labs( x="Year", y="Population (thousands)" )
}
