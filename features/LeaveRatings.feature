Feature: Leave rating on application
  Background: I have registered and logged in
    Given I have created a faculty account with email "name@mail.com" and password "pass"
    Given I have logged into an account with email "name@mail.com" and password "pass"

    Scenario: Leave rating on application

      When I have left a rating with value "1" on an application with id "2"
      And I am viewing an application

      Then I should see a rating with value "1" and application id "2"