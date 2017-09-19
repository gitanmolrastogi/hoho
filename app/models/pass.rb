class Pass < ApplicationRecord
	has_many :orders , as: :orderable
	validates :name, uniqueness: {:case_sensitive => false}
end
