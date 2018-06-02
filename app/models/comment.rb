class Comment < ApplicationRecord
<<<<<<< HEAD
  belongs_to :user, optional: true, dependent: :destroy
  belongs_to :video, dependent: :destroy
=======
  belongs_to :user, optional: true
  belongs_to :video

>>>>>>> so many changes
end
