class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @contents = @user.contents.order(created_at: :desc).page(params[:page]).per(50)
  end
end