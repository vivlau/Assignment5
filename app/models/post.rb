class Post < ApplicationRecord
  belongs_to :author
  has_many :comments

  validates :title, presence: true,
                    length: { minimum: 5 }
end
