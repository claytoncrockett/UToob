class VideosController < ApplicationController
 before_action :set_video, only: [:show, :update, :edit, :destroy]

  
  def index
    @videos = Video.all
  end

  def show
  end

  def new
    @video = Video.new
    render :form
  end

  def edit
    render :form
  end

  def create  
    @video = Video.new(video_params)

      if @video.save
        # flash[:success] = 'Video added'
        redirect_to videos_path
      else
        # flash[:error] = "Error: #{@playlist.errors.full_messages.join("\n")}"
        render :form
      end
  end

  def update
    if @video.update(video_params)
      flash[:success] = 'Video updated'
      redirect_to videos_path
    else
      flash[:error] = "Error: #{@playlist.errors.full_messages.join("\n")}"
      render :form
    end
  end

  def destroy
    @video.destroy
    flash[:success] = 'Video deleted'
    redirect_to videos_path
  end

private

    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :duration, :genre, :description, :trailer, :like, :dislike, :playlist)
    end
    def set_video
      @video = Video.find(params[:id])
    end
end
