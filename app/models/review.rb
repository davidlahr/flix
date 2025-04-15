class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  STARS = [1,2,3,4,5]

  # validates :name, presence: true
  validates :comment, length: { minimum: 4 }
  validates :stars, inclusion: { in: STARS}
  
  def stars_as_percent
    (stars / 5.0) * 100.0
  end

  scope :past_60_days, -> {where("created_at >?", 80.days.ago)}

end
