class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_user
  before_action :set_video

  def index
    @comments = Comment.all
  end

  def show
    @comment = @video.comments
  end

  def new
    @comment = @video.comments.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @comment = @video.comments.new(comment_params)
    @comment.user_id = @user.id
    if @comment.save
      redirect_to video_path(@video)
      flash[:success] = 'Comment added'
    else
      flash[:error] = "Error: #{@playlist.errors.full_messages.join("\n")}"
      render :form
    end
  end

  def update
    if @comment.update(comment_params)
      redirect_to video_path(@video)
      flash[:success] = 'Comment updated'
    else
      flash[:error] = "Error: #{@playlist.errors.full_messages.join("\n")}"
      render :form
    end
  end

  def destroy
    @comment.destroy
    flash[:success] = 'Comment deleted'
    redirect_to video_path(@video)
  end


  private

  def set_video
    @video = Video.find(params[:video_id])
  end

  def set_user
    @user = current_user
  end

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:body, :user_id, :video_id)
  end
end
