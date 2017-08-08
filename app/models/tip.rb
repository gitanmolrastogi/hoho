class Tip < ApplicationRecord
	#validation starts here...

      validates :title, presence: true
      validates :content, presence: true

	#validation ends here...
end
