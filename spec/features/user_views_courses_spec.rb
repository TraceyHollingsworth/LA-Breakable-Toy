require 'rails_helper'

feature "Create a Course", %q(

  As a user
  I want to be able to see a list of courses
  So that I can see what others are teaching.

  Acceptance Criteria
  [ ] If I navigate to the /courses path, I
      should see a list of courses.

) do
  context "authenticated user" do
    let(:user){ FactoryGirl.create(:user) }

    before(:each) do
      visit new_user_session_path
      sign_in_as(user)
    end

    scenario "view list of courses" do
      course = FactoryGirl.create(:course)

      visit new_course_path
      fill_in "course[title]", with: course.title
      fill_in "course[description]", with: course.description
      click_button "Create Course"
      visit courses_path

      expect(page).to have_content course.title
    end
  end
end

