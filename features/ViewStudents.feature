
Feature: view the table of student information

Background: User has registered and logged in
  Given I have created a faculty account with email "name@mail.com" and password "pass"
  Given I have logged into an account with email "name@mail.com" and password "pass"

  Scenario: load the faculty member home page to see the table of student information
    When I am on the index page
    When I have added a student with First Name "Name" and Last Name "Last"
    Then I should see a student with First Name "Name" and Last Name "Last"

  Scenario: Sort students by age
    When I am on the index page
    Given I have added a student with First Name "Gary" and Age "21"
    And I have added a student with First Name "Harry" and Age "12"

    When I have sorted students by age

    Then I should see a student with first name "Harry" before I see a student with first name "Gary"

  Scenario: Sort students by name
    When I am on the index page
    Given I have added a student with name "Harry" and GPA "4.0"
    Given I have added a student with name "Gary" and GPA "3.5"

    When I have sorted students by first name

    Then I should see a student with first name "Gary" before I see a student with first name "Harry"