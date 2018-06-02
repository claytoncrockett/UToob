class PlaylistsController < ApplicationController
  def index
    @playlists = Department.all
  end

  def show
  end

  def new
    @playlist = Playlist.new
    render :form
  end

  def edit
    render :form
  end

  def create
    @playlist = Playlist.new(playlist_params)
      if @playlist.save
        redirect_to @playlist
      else
        render :form
      end
  end

  def update
    if @playlist.update(playlist_params)
      redirect_to @playlist
    else
      render :form
    end
  end

  def destroy
    @playlist.destroy
    redirect_to playlists_path
  end

  private

    def playlist_params
      params.require(:playlist).permit(:title)
    end

end
