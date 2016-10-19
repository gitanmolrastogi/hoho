class Bus < ApplicationRecord
	has_many :orders , as: :orderable
end
