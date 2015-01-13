require 'rails_helper'

feature "Create a Course", %q(
  As a user
  I want to create an account
  So that I can participate in courses

  Acceptance Criteria

  [X] There is a link to 'Sign Up' on the homepage.
  [X] If a user is signed in, the homepage displays "Sign Out".
  [X] If a user is not signed in, the homepage displays "Sign Up" and "Sign In".
  [X] If I fill in my first name, last name, display_name, email, password, and password confirmation correctly,
      I am greeted with a confirmation message that my account has been created.
  [X] If the password and password confirmation fields do not match, I am given an error message.
  [X] If my email already exists in the database, I am given a message that tells me I have already registered.
  [X] If my email is not formatted correctly, I am given an error message.

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
    expect(page).to_not have_link "Sign Up"
    expect(page).to have_link "Sign Out"
  end

  scenario "user provides mismatched passwords" do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Joe"
    fill_in "Last Name", with: "Shmoe"
    fill_in "Display Name", with: "Mr. Shmoe"
    fill_in "Email", with: "user@example.com"
    fill_in "Password", with: "supersecret"
    fill_in "Password confirmation", with: "notsupersecret"
    click_button "Sign Up"

    expect(page).to have_content "Password confirmation doesn't match"
  end

  scenario "user provides incorrect email format" do
    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: "Joe"
    fill_in "Last Name", with: "Shmoe"
    fill_in "Display Name", with: "Mr. Shmoe"
    fill_in "Email", with: "user"
    fill_in "Password", with: "supersecret"
    fill_in "Password confirmation", with: "supersecret"
    click_button "Sign Up"

    expect(page).to have_content "Email is invalid"
  end

  scenario "email is already registered" do
    existing_user = User.create(
      first_name: "Joe",
      last_name: "Shmoe",
      display_name: "Mr. Shmoe",
      email: "user@example.com",
      password: "supersecret",
    )

    visit root_path
    click_on "Sign Up"

    fill_in "First Name", with: existing_user.first_name
    fill_in "Last Name", with: existing_user.last_name
    fill_in "Display Name", with: existing_user.display_name
    fill_in "Email", with: existing_user.email
    fill_in "Password", with: existing_user.password
    fill_in "Password confirmation", with: existing_user.password
    click_button "Sign Up"

    expect(page).to have_content "Email has already been taken"
  end
end
