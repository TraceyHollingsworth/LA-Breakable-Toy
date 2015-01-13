class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to courses_path, notice: "Course Created Successfully!"
    else
      render :new
    end
  end

  private

  def course_params
    params.require(:course).permit(
      :title,
      :description
    )
  end
end
