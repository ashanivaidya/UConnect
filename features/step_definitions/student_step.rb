
# frozen_string_literal: true
When /^I have added a student with First Name "(.*?)" and Last Name "(.*?)"$/ do |first_name, last_name|
  Student.create! :first_name => first_name,:last_name => last_name, :email_id => 'user@gmail.com'

end

Then /^I should see a student with First Name "(.*?)" and Last Name "(.*?)"$/ do |first_name, last_name|
  result = false
  all("tr").each do |tr|
    if tr.has_content?(first_name) && tr.has_content?(last_name)
      result = true
      break
    end
  end
  expect(result).to eq(true)
end

When /^I have added a student with First Name "(.*?)" and Age "(.*?)"$/ do |first_name, age|
  Student.create! :first_name => first_name,:age => age, :email_id => 'user@gmail.com'
end

When /^I have sorted students by first name$/ do
  click_on 'First Name'
end

When /^I have sorted students by age$/ do
  click_on 'Age'
end

Then /^I should see a student with first name "(.*?)" before I see a student with first name "(.*?)"$/ do |name1, name2|
  expect(page.body =~ /(#{name1})(\w|\W)*(#{name2})/).to be_truthy
end

When /^I am on the index page$/ do
  visit students_index_path
end

When /^I am on the student page$/ do
  visit students_show_path
end

When /^I search for a university named "(.*?)"$/ do |name|
  fill_in 'search_box', with: name
  click_on 'Search Universities'
end

Then /^I should see a university with "(.*?)" in its name$/ do |name|
  result = false
  all("tr").each do |tr|
    if tr.has_content?(name)
      result = true
      break
    end
  end
  expect(result).to eql?(true)
end

When /^I have created an account with email "(.*?)" and password "(.*?)"$/ do |email, pass|
  visit '/users/sign_up'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: pass
  fill_in 'user_password_confirmation', with: pass
  click_on 'Sign Up'
end

When /^I have created a faculty account with email "(.*?)" and password "(.*?)"$/ do |email, pass|
  visit '/users/sign_up'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: pass
  fill_in 'user_password_confirmation', with: pass
  choose 'Faculty'
  click_on 'Sign Up'
end

When /^I have logged into an account with email "(.*?)" and password "(.*?)"$/ do |email, pass|
  visit '/users/sign_in'
  fill_in 'user_email', with: email
  fill_in 'user_password', with: pass
  click_on 'Log in'
end

When /^I have added a student with name "(.*?)" and GPA "(.*?)"$/ do |name, gpa|
  Student.create(:name => name, :gpa => gpa)
end

Given /^I am on the faculty home page$/ do
  visit students_faculty_home_path
end
#
#
Then /^I should see a student with name "(.*?)" and GPA "(.*?)"$/ do |name, gpa|
  result = false
  all("tr").each do |tr|
    if tr.has_content?(name) && tr.has_content?(gpa)
      result = true
      break
    end
  end
  expect(result).to be_truthy
end

Then(/^I should be able to go to my application$/) do
  result = false
  all("h2").each do |h2|
    if h2.has_content?('My Applications')
      result = true
    end
  end
  expect(result).to be_truthy
end

Then(/^I should see my estimated chance of acceptance$/) do
  result = false
  all("td").each do |td|
    if td.has_content?('Chance of Acceptance')
      result = true
    end
  end
  expect(result).to be_truthy
end

Then(/^I should see my personal information$/) do
  result = false
  all("h2").each do |h2|
    if h2.has_content?('Profile Info')
      result = true
    end
  end
  expect(result).to be_truthy
end

When(/^I am on the admin page$/) do
  visit admin_path
end

Then(/^I should be able to select an account with email "([^"]*)"$/) do |email|

  expect(page.body =~ /(#{email})/).to be_truthy

end

When(/^I have left a rating with value "([^"]*)" on an application with id "([^"]*)"$/) do |rating, app_id|
  visit '/ratings/new'
  fill_in 'Application ID', with: app_id
  fill_in 'User ID', with: 1
  select rating, from: 'rating'

end

Then(/^I should see a rating with value "([^"]*)" and application id "([^"]*)"$/) do |rating, app_id|
  result = false
  all("tr").each do |tr|
    if tr.has_content?(rating) && tr.has_content?(app_id)
      result = true
      break
    end
  end
  expect(result).to be_truthy
end

Given(/^I am viewing an application$/) do
  visit '/ratings/index'
end

When(/^I have logged in with the admin account$/) do
  User.create! :name => 'Admin', :email => 'admin@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret', :role => 2, :status => 'confirmed'
  visit '/users/sign_in'
  fill_in 'user_email', with: 'admin@gmail.com'
  fill_in 'user_password', with: 'topsecret'
  click_on 'Log in'
end