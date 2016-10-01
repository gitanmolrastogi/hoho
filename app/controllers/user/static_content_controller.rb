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

 #Admin side check request methods(START)
  def check_city
  	city=params[:city][:name].downcase
  	@city=City.find_by(name: city)
  	if @city.present?
  		render :json=>false
    else
    	render :json=>true
    end		
  end

  def check_category
  	 p "======ccc==#{params.inspect}===="
  	category=params[:category][:name].downcase
  	@category=Category.find_by(name: category)
  	if @category.present?
  		render :json=>false
    else
    	render :json=>true
    end		
  end

 #Admin side check request methods(END)



end
