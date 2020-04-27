class UsersController < ApplicationController
  def index
    @contents = current_user.contents
  end
end
