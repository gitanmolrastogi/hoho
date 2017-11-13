class Activity < ApplicationRecord
  belongs_to :city
  belongs_to :category
  mount_uploader :image, PhotoUploader

  has_many :photos, as: :imageable,dependent: :destroy	
  has_many :orders , as: :orderable
  accepts_nested_attributes_for :photos, :allow_destroy => true

   #validation starts here...

  validates :name, presence: true
	validates :overview, presence: true
	validates :information, presence: true
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	
   #validation end here...
end

