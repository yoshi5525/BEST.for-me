class Contents::SearchesController < ApplicationController
  def index
    @contents = Content.search(params[:keyword]).includes(:user).order(created_at: :desc).page(params[:page]).per(20)
  end
end