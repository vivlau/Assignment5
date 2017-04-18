class Post < ApplicationRecord
  acts_as_votable
  
  belongs_to :author
  has_many :comments

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  validates :title, presence: true
end
