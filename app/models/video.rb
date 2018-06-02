class Video < ApplicationRecord
  has_many :comments
  belongs_to :playlist, optional: true
end
