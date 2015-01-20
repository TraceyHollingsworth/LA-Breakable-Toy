class CoursesController < ApplicationController
  before_action :authenticate_user!

  def index
    @courses = current_user.courses
  end

  def new
    authorize_teacher!
    @course = current_user.courses.build
  end

  def create
    authorize_teacher!
    @course = current_user.courses.build(course_params)

    if @course.save
      redirect_to courses_path, notice: "Course Created Successfully!"
    else
      flash[:alert] = @course.errors.full_messages.join(".  ")
      render :new
    end
  end

  def show
    @course = Course.find(params[:id])
  end

  def edit
    @course = current_user.courses.find(params[:id])
  end

  def update
    @course = current_user.courses.find(params[:id])
    if current_user.id == @course.user_id
      if @course.update(course_params)
        flash[:success] = "You've successfully updated a course!"
        redirect_to @course
      else
        flash[:alert] = @course.errors.full_messages.join(".  ")
        render "edit"
      end
    else
      redirect_to root_path
      flash[:alert] = "You are not the owner of that course."
    end
  end

  def destroy
    @course = Course.find(params[:id])
    if current_user.id == @course.user_id
      @course.destroy
      flash[:success] = "You've successfully deleted a course!"
      redirect_to root_path
    else
      flash[:alert] = "You are not authorized to do this."
      redirect_to course_path(@course)
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
