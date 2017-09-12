class Pass < ApplicationRecord
	has_many :orders , as: :orderable
end
