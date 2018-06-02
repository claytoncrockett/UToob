class Playlist < ApplicationRecord
  belongs_to :user, dependent: :destroy
  has_many :videos
end
