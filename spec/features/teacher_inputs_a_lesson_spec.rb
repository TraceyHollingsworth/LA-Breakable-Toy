require 'rails_helper'

feature "Create a Lesson", %q(

  As a teacher
  I want to be able to create a lesson
  So that others can see what I'm teaching.

  Acceptance Criteria
  [ ] I must be signed in to add a lesson
  [ ] I must be a user with a teacher role
  [ ] I must enter a week, day, and objective
  [ ] I can optionally add prework, lecture,
      postwork, extra_help, and add_ons
  [ ] If all required fields are complete, I am told that
      my lesson has been saved.
  [ ] If a required field is incomplete, I am given an
      error message and brought back to the form.

) do

  context "authenticated user" do
    before(:each) do
      user = User.create(
        first_name: "Joe",
        last_name: "Shmoe",
        display_name: "Mr. Shmoe",
        email: "user@example.com",
        password: "supersecret",
      )

      visit new_user_session_path
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
      click_button "Log in"

      visit new_lesson_path
    end

    scenario "teacher creates a course" do
      fill_in "Title", with: "Algebra"
      fill_in "Description", with: "Algebra is the foundation for all higher maths."

      click_button "Create Course"

      expect(page).to have_content("Course Created Successfully!")
    end

    scenario "teacher is given an error if they forget a title" do
      click_button "Create Course"

      expect(page).to have_content("Title can't be blank")
      expect(page).to have_content("New Course")
    end
  end

  context "unauthenticated user" do
    scenario "user cannot access new course form" do
      visit new_course_path

      expect(page).to have_content("You need to sign in or sign up")
    end
  end
end
