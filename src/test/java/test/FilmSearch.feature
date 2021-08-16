Feature: Film arama kontrol senaryolari

  Background:

    Given param apikey = "5343c842"
    Given param s = "Harry potter"
    Given url omdbapiURL

  Scenario: Film arama islemi
    When method GET
    And status 200
    * json searchObject =  response.Search
    * def searchTitle = "Harry Potter and the Sorcerer's Stone"
    * def filmList = function(){ var imdbIdVal=0 ; for(var i = 0; i < searchObject.length; i++) {if(searchObject[i].Title==searchTitle){ imdbIdVal = searchObject[i].imdbID;}}  return imdbIdVal ; }
    * def imdbIDVal = filmList()
    And print searchTitle , ' titlına ait ımdbID : ',imdbIDVal
    And param apikey = "5343c842"
    Given url  'http://www.omdbapi.com/?i=' + imdbIDVal
    When  method GET
    And print response
    And match response.Year == '2001'
    And match response.Title == searchTitle
    And match response.Released == '16 Nov 2001'





