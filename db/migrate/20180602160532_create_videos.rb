class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :title
      t.string :duration
      t.string :genre
      t.string :description
      t.integer :like
      t.integer :dislike
      t.string :trailer

      t.timestamps
    end
  end
end
