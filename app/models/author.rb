class Author < ApplicationRecord
  has_many :posts, dependent: :nullify

  has_attached_file :avatar
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/

  has_secure_password

  validates :name, presence: true

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i

  validates :email, presence: true,
            uniqueness: { case_sensitive: false },
            format: VALID_EMAIL_REGEX

  before_validation :downcase_email

  private

  def downcase_email
    self.email.downcase! if email.present?
  end
end
