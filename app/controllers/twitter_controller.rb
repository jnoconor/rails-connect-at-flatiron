class TwitterController < ApplicationController

  def follow
    @cohort = Cohort.find(params[:cohort_id])
    @friends = @cohort.student_twitter_handles(current_user)
    current_user.add_friends(@friends)
    @followed = TwitterFollower.new(current_user).follow_users(@friends)
    flash[:new_friends] = @followed.collect(&:screen_name) if @followed
    redirect_to cohort_path(@cohort)
  end

end