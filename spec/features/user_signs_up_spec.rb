require 'rails_helper'

feature "Create a Course", %q(
  As a user
  I want to create an account
  So that I can participate in courses

  Acceptance Criteria

  [X] There is a link to 'Sign Up' on the homepage.
  [X] If I fill in my first name, last name, display_name, email, password, and password confirmation correctly,
      I am greeted with a confirmation message that my account has been created.
  [ ] If the password and password confirmation fields do not match, I am given an error message.
  [ ] If my email already exists in the database, I am given a message that tells me I have already registered.
  [ ] If my email is not formatted correctly, I am given an error message.

) do

  scenario "user provides valid information" do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Joe"
    fill_in "Last Name", with: "Shmoe"
    fill_in "Display Name", with: "Mr. Shmoe"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "supersecret"
    fill_in "Password confirmation", with: "supersecret"
    click_button "Sign Up"

    expect(page).to have_content "Welcome! You have signed up successfully."
  end
end
