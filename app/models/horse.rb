class Horse < ApplicationRecord
  belongs_to :user
  has_many :bookings

  validates :name, presence: true
  validates :age, presence: true
  validates :gender, presence: true
  validates :photo, presence: true
  validates :price, presence: true
  validates :category, presence: true
  validates :localisation, presence: true

  mount_uploader :photo, PhotoUploader

  # include PgSearch
  #   pg_search_scope :global_search
  #     against: [ :name, :coat, :gender, :breed, :category ],
  #     using: {
  #       tsearch: { prefix: true }
  #     }
end
