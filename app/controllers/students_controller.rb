class StudentsController < ApplicationController
  before_action :set_student, :only => [:show, :edit, :update, :destroy]
  before_action :set_cohort

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.cohort = @cohort
    if @student.save
      redirect_to cohort_student_path(@cohort, @student)
    else
      render 'students/new'
    end
  end

  def show
  end

  def edit
  end

  def update
    @student.update(student_params)
    redirect_to cohort_student_path(@cohort, @student)
  end

  def destroy
    @student.destroy
    redirect_to cohort_path(@cohort)
  end

  private
    def set_student
      @student = Student.find(params[:id])
    end

    def set_cohort
      @cohort = Cohort.find(params[:cohort_id])
    end

    def student_params
      params.require(:student).permit(:full_name, :twitter, :linkedin, :github, :quote, :bio, :work_title, :education, :profile_image)
    end
end
