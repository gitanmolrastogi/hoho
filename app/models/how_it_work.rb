class HowItWork < ApplicationRecord
	mount_uploader :image, HowItWorkImageUploader

	#validation starts here...

      validates :title, presence: true
      validates :content, presence: true

	#validation ends here...
end
