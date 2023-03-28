Feature: Edit student's profile details in the system

  Background: User has registered and logged in
    Given I have created an account with email "name@mail.com" and password "pass"
    Given I have logged into an account with email "name@mail.com" and password "pass"

    Scenario: Visit Edit student details page
      Given I go to Edit student details page
      Then I will verify that the page's title is- Edit Profile

    Scenario: Add student's personal information
      Given I go to Edit student details page
      When I add name "name" to the first name text field and save it
      And I go to Edit student details page
      Then I will see first name as "name"

    Scenario: Clicking Add Education should create new fields in the edit form
      Given I go to Edit student details page
      When I click on add education link
      Then I should see a GPA text field added

    Scenario:  Add education details for the student
      Given I go to Edit student details page
      When I click on add education link
      And I write "3.5" as GPA and save it
      Given I go to Edit student details page
      Then I should see the GPA as "3.5"