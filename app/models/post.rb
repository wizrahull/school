class Post < ApplicationRecord
  belongs_to :user
  validates :caption, presence: true, length: {maximum: 50}
  validates :media, exclusion: { in: %w(Audio audio ),
    message: "%{value} We are not supporting audio currently." }
  
end
