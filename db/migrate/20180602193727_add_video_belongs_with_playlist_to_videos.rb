class AddVideoBelongsWithPlaylistToVideos < ActiveRecord::Migration[5.2]
  def change
    add_reference :videos, :playlist, foreign_key: true
  end
end
