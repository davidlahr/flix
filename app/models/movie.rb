class Movie < ApplicationRecord
  before_save :set_slug
  
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  has_many :characterizations, dependent: :destroy
  has_many :genres, through: :characterizations

  has_one_attached :main_image

  RATINGS = %w(G PG PG-13 R NC-17)
  # RATINGS = ['PG','PG-13','R','NC-17']
  # 
  validates :name, presence: true, uniqueness: true


  # validates :release_date, :duration, presence: true
  validates :description, length: {minimum: 25}
  validates :total_gross,numericality: {greater_than_or_equal_to: 0}

  # removed when moved to active storage
  # validates :image_file_name, format: {
  #     with: /\w+\.(jpg|jpeg|png)\z/i,
  #     message: "must be a JPG or PNG image"
  #   }
     
  validates :rating, inclusion: { in: RATINGS }

  validate :acceptable_image

  def self.old
    where("release_date < ?", "2000-01-01").order("release_date desc")
  end

  # def self.released
  #   where("release_date < ?", Time.now).order("release_date desc")
  # end

  scope :released, -> { where("release_date < ?", Time.now).order("release_date desc") }
  scope :upcoming, -> { where("release_date > ?", Time.now).order("release_date desc") }
  scope :recent, -> (m=3) { released.limit(m) }
  
  scope :flops, -> { where("total_gross < 300000000") }


  
  def flop?
    total_gross.nil? || total_gross < 300000000
  end

  def average_review
    if reviews.size == 0
      0
    else
      reviews.average(:stars) * 100 / 5
    end
  end

  

  def to_param
    slug
  end

  private

  def acceptable_image
    return unless main_image.attached?

    unless main_image.blob.byte_size <= 1.megabyte
      errors.add(:main_image, "is too big")
    end

    acceptable_types = ["image/jpeg", "image/png", "image/jpg"]
    unless acceptable_types.include?(main_image.content_type)
      errors.add(:main_image, "must be a png, jpg, or jpeg")
    end
  end

  def set_slug
    self.slug = name.parameterize
  end

end
