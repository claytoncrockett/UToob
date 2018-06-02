class Comment < ApplicationRecord
  belongs_to :user, optional: true, dependent: :destroy
  belongs_to :video, dependent: :destroy
end
