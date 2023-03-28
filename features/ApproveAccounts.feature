Feature: Approve new faculty accounts

  Background: User has registered and logged in
    Given I have created an account with email "name@mail.com" and password "pass"
    Given I have logged into an account with email "name@mail.com" and password "pass"

  Scenario: Search for university information
    When I have logged in with the admin account
    And I am on the admin page
    Then I should be able to select an account with email "name@mail.com"