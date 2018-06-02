class Video < ApplicationRecord
  has_many :comments
  belongs_to :playlist, optional: true

  def self.find_name(video)
    Comment.find_by_sql("
    SELECT comments.*,first_name FROM comments
    LEFT JOIN users
      ON comments.user_id = users.id
    WHERE video_id = #{video.id}
    ")
  end

end
