class VideosController < ApplicationController
  before_action :set_playlist, only: [:show, :update, :edit, :destroy]

  
  def index
    @videos = @playlist.videos
  end

  def show
  end

  def new
    @video = @playlist.videos.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @video = @playlist.videos.new(video_params)
      if @video.save
        redirect_to [@playlist, @video]
      else
    render :new
    end
  end

  def update
    if @video.update(video_params)
      redirect_to [@playlist, @video]
    else
      render :edit
    end
  end

  def destroy
    @video.destroy
    redirect_to playlist_videos_path
  end

private

    def set_playlist
      @playlist = Playlist.find(params[:id])
    end

    def video_params
      params.require(:).permit(:name)
    end
end