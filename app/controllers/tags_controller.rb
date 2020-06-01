class TagsController < ApplicationController
  def show
    @tag = Tag.find(params[:id])
    @contents = @tag.contents.order(created_at: :desc).page(params[:page]).per(20)
  end
end
