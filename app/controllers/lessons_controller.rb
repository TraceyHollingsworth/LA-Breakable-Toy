class LessonsController < ApplicationController

  def index
    @lessons = Lesson.order( "lessons.created_at DESC")
  end

  def show
    @lesson = Lesson.find(params[:course_id])
  end

  def create
    @course = Course.find(params[:course_id])
    @lesson = @course.lessons.new(lesson_params)

    if @lesson.save
      redirect_to course_path(@course)
    else
      flash[:warning] = @lesson.errors.full_messages.join(".  ")
      redirect_to course_path(@course)
    end
  end

  private

  def lesson_params
    params.require(:lesson).permit(:date, :objective, :prework, :lecture, :postwork, :extra_help, :add_ons)
  end
end
