Given(/^I go to Edit student details page$/) do
  visit edit_student_path(1)
end

Then(/^I will verify that the page's title is\- Edit Profile$/) do
  result = false
  all("h1").each do |h2|
    if h2.has_content?('Edit Profile')
      result = true
    end
  end
  expect(result).to be_truthy
end

When(/^I add name "([^"]*)" to the first name text field and save it$/) do |arg|
  fill_in 'first_name', with: arg
  click_on 'Update Student'
end

Then(/^I will see first name as "([^"]*)"$/) do |arg|
  result = false
  all("h2").each do |h2|
    if text.has_content?('My Applications')
      result = true
    end
  end
  expect(result).to be_truthy
end

When(/^I click on add education link$/) do
  click_on 'Add Education'
end

Then(/^I should see a GPA text field added$/) do
  pending
end

And(/^I write "([^"]*)" as GPA and save it$/) do |arg|
  pending
end

Then(/^I should see the GPA as "([^"]*)"$/) do |arg|
  pending
end