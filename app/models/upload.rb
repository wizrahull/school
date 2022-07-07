class Upload < ApplicationRecord
  belongs_to :user
  validates :caption , presence: true, uniqueness: { case_sensitive: false }
  
  
  
end
