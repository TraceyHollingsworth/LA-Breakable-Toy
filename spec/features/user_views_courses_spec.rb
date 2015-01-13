require 'rails_helper'

feature "Create a Course", %q(

  As a user
  I want to be able to see a list of courses
  So that I can see what others are teaching.

  Acceptance Criteria
  [ ] If I navigate to the /courses path, I
      should see a list of courses.

) do

  scenario "view list of courses" do
    courses = []
    3.times do |x|
      attrs = {
        title: "Algebra #{x}",
        description: "Best course ever!"
      }

      courses << Course.create(attrs)
    end

    visit courses_path

    courses.each do |course|
      expect(page).to have_content course.title
    end
  end
end
