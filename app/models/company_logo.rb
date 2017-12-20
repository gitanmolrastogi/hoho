class CompanyLogo < ApplicationRecord
	mount_uploader :image, LogoUploader
end
