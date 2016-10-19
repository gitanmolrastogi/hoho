class Activity < ApplicationRecord
  belongs_to :city
  belongs_to :category
  mount_uploader :image, PhotoUploader

  has_many :photos, as: :imageable	
  has_many :orders , as: :orderable
  accepts_nested_attributes_for :photos, :allow_destroy => true


end
