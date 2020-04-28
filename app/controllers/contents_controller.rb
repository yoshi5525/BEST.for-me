class ContentsController < ApplicationController
before_action :set_content, only: [:edit, :update, :destroy, :show]
before_action :move_to_index, except: [:index, :show]

  def index
    @contents = Content.includes(:user).order(created_at: :desc).page(params[:page]).per(50)
  end

  def new
    @content = Content.new
  end

  def create
    @content = Content.new(content_params)
    if @content.save
      redirect_to @content, notice: "投稿しました"
    else
      render :new, alert: "投稿できませんでした"
    end
  end

  def edit
  end

  def update
    if @content.update(content_params)
      redirect_to @content, notice: "更新しました"
    else
      render :edit, alert: "更新できませんでした"
    end
  end

  def destroy
    if  @content.destroy
      redirect_to root_path, notice: "削除しました"
    else
      redirect_to root_path, alert: "削除できませんでした"
    end
  end

  def show
  end

  private
  def content_params
    params.require(:content).permit(:image, :product, :link, :body).merge(user_id: current_user.id)
  end

  def set_content
    @content = Content.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

end
