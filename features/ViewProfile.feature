
Feature: Access the profile page for students

Background: User has registered and logged in
  Given I have created a faculty account with email "name@mail.com" and password "pass"
  Given I have logged into an account with email "name@mail.com" and password "pass"

  Scenario: Search for university information
    Given I am on the student page

    When I search for a university named "Iowa"
    Then I should see a university with "Iowa" in its name


  Scenario: View application
    When I am on the student page

    Then I should be able to go to my application

  Scenario: View chance of acceptance
    When I am on the student page

    Then I should see my estimated chance of acceptance

  Scenario: View personal information
    When I am on the student page

    Then I should see my personal information