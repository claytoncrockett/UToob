class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def index
    @comments = Comment.all
  end

  def show
    @comment = @comment.video
  end

  def new
    @comment = Comment.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to comments_path
    else
      render :form
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to @comment
    else
      render :form
    end
  end

  def destroy
    @comment.destroy
    redirect_to comments_path
  end


  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :video_id)
  end
end
