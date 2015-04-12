class CohortsController < ApplicationController
  def index
    @cohorts = Cohort.all.order(:name)
  end

  def show
    @cohort = Cohort.find(params[:id])
    @students = @cohort.students.order(:full_name)
    @friends = Friend.find_user_friends(current_user).collect(&:username)
  end
end
