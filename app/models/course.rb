class Course < ApplicationRecord
  has_many :steps
  has_many :user_courses
  has_many :megaliths, through: :steps

  has_one_attached :photo

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?


  include PgSearch::Model
    pg_search_scope :search_by_name_and_city,
      against: [ :name, :city, :latitude, :longitude],
      using: {
        tsearch: { prefix: true }
    }

end
