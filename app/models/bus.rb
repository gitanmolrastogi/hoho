class Bus < ApplicationRecord
	has_many :orders , as: :orderable

   #validation starts here...
  
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :start_point, presence: true
	validates :end_point, presence: true
	validates :price, presence: true

   #validation ends here...
end
