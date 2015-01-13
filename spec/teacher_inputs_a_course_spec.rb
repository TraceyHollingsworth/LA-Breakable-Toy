require 'rails_helper'

feature "Create a Course", %q(

  As a teacher
  I want to be able to create a course
  So that others can see what I'm teaching.

  Acceptance Criteria
  [ ] I must be a user with a teacher role
  [X] I must enter a title
  [ ] I can optionally enter a description
  [X] If all fields are complete, I am told that
      my course has been saved.
  [ ] If a field is incomplete, I am given an
      error message and brought back to the form.

) do

  scenario "Teacher creates a course" do
    visit new_course_path
    fill_in "Title", with: "Algebra"

    click_button "Create Course"

    expect(page).to have_content("Course Created Successfully!")
  end
end
