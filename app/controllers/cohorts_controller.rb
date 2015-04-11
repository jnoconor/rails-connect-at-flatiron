class CohortsController < ApplicationController
  def index
    @cohorts = Cohort.all
  end

  def new
    @cohort = Cohort.new
  end

  def create
  end

  def show
    @cohort = Cohort.find(params[:id])
  end
end
