class User < ApplicationRecord
  before_save :downcase_email

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie

  has_secure_password

  validates :name, presence: true
  validates :email, format: {with: /\S+@\S+/}, uniqueness:{ case_sensitive: false }
  validates :password, length: { minimum: 6, allow_blank: true }

  scope :by_name, -> {order(name: :desc)}
  scope :not_admins, -> { by_name.where("admin = false")}
  
  private

  def downcase_email
    self.email = email.downcase
  end


end
