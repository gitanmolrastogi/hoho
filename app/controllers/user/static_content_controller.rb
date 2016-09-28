class User::StaticContentController < ApplicationController

	def about_us
		@about_us=StaticPage.first.try(:content)
	end

	def terms_and_condition
		@terms_and_condition=StaticPage.third.try(:content)
	end

	def privacy_policy
		@privacy_policy=StaticPage.second.try(:content)
	end
end
