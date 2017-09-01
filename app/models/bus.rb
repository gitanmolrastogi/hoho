class Bus < ApplicationRecord
	has_many :orders , as: :orderable
  has_many :bus_timings, dependent: :destroy
    #callbacks
    before_save :convert_into_downcase_start_and_end_point
    accepts_nested_attributes_for :bus_timings

   #validation starts here...
  
	validates :start_date, presence: true
	validates :end_date, presence: true
	validates :start_time, presence: true
	validates :end_time, presence: true
	validates :start_point, presence: true
	validates :end_point, presence: true
	validates :price, presence: true

   #validation ends here...

   #callbacks starts here....
    
    def convert_into_downcase_start_and_end_point
       start_point.downcase!
       end_point.downcase!
    end

   #callbacks ends here...

end
