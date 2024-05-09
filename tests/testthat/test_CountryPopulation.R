test_that('Does CountryPopulation Work', {
  expect_error(CountryPopulation(China))
  expect_error(CountryPopulation("United States"))
  expect_error(CountryPopulation("Chinr"))
})
