class User::StaticContentController < ApplicationController

  def tips
   @tips= params[:tip_id].present? ? Tip.find_by(id: params[:tip_id]) : Tip.all 
  end

  def faq
    @faq=QuestionsAndAnswer.first
    @faqs=((QuestionsAndAnswer.all) - Array(@faq))
  end

	def about_us
		@about_us=StaticPage.find_by(title: "About Us").try(:content).html_safe
	end

	def terms_and_condition
		@terms_and_condition=StaticPage.find_by(title: "Terms and Conditions").try(:content).html_safe
	end

	def privacy_policy
		@privacy_policy=StaticPage.find_by(title: "Privacy Policy").try(:content).html_safe
	end

  def contact_us
    # @privacy_policy=StaticPage.second.try(:content)
  end

  def contact_admin
    redirect_to '/'
    flash[:success] = "Information sent to admin successfully."

    # render 'user/home/dashboard'

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

private

def contact_params
  params.permit(:first_name,:last_name,:email,:mobile_number,:subject,:help)
  
end

end
