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
        redirect_to videos_path
      else
    render :new
    end
  end

  def update
    if @video.update(video_params)
      redirect_to videos_path
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to videos_path
  end

private

    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def video_params
      params.require(:video).permit(:title, :duration, :genre, :description, :trailer, :like, :dislike)
    end
    def set_video
      @video = Video.find(params[:id])
    end
end