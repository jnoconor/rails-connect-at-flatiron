class SessionsController < ApplicationController

  skip_before_action :authorize, only: [:new, :create]

  def new
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    login(@user)
    redirect_to '/'
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Signed out!'
    redirect_to signin_path
  end

  private
    def auth_hash
      request.env['omniauth.auth']
    end
end
