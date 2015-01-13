require 'rails_helper'

feature "Create a Course", %q(

  As a teacher
  I want to be able to create a course
  So that others can see what I'm teaching.

  Acceptance Criteria
  [ ] I must be a user with a teacher role
  [X] I must enter a title
  [X] I can optionally enter a description
  [X] If all required fields are complete, I am told that
      my course has been saved.
  [X] If a required field is incomplete, I am given an
      error message and brought back to the form.

) do

  scenario "teacher creates a course" do
    visit new_course_path
    fill_in "Title", with: "Algebra"
    fill_in "Description", with: "Algebra is the foundation for all higher maths."

    click_button "Create Course"

    expect(page).to have_content("Course Created Successfully!")
  end

  scenario "teacher is given an error if they forget a title" do
    visit new_course_path

    click_button "Create Course"

    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content("New Course")
  end
end
