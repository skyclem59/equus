class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :horse

  validates :date_from, presence: true
  validates :date_to, presence: true

end
