class Course < ApplicationRecord
  has_many :steps
  has_many :user_courses

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

end
