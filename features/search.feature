@search
Feature: Wikipedia search

  Scenario: As Wikipedia user, I would like to perform simple search
    Then I land on Today's featured article
    And I tap on Search button
    Then I land on Search screen
    And I type "Metallica" into search field
    Then I see that 1st search result include "Metallica"
    When I tap on 1st result on search result page
    And I verify that article title include "Metallica"