class Activity < ApplicationRecord
  belongs_to :city
  belongs_to :category

  has_many :photos, as: :imageable
end
