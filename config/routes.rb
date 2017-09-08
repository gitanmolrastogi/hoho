Rails.application.routes.draw do


  # namespace :user do
  #   get 'bookings/index'
  # end

  # namespace :user do
  #   get 'passes/index'
  # end

  get "user/forums" => "user/home#forums"  

  get '/check_new_city_name' => 'user/users#check_new_city_name'

mount Ckeditor::Engine => '/ckeditor'
devise_for :admin_users, ActiveAdmin::Devise.config
ActiveAdmin.routes(self)
devise_for :users ,:controllers => { sessions: 'user/sessions',registrations: 'user/registrations' }

 root :to=>'user/home#dashboard'
 get  '/users/check_email', to: 'user/users#check_email'
 get  '/users/find_email', to: 'user/users#find_email'
 
 get  '/dashboard', to: 'user/home#dashboard'
 get '/user/home/read_more',to: 'user/home#read_more'
 get '/user/home/read_less',to: 'user/home#read_less'

 get  '/user/contact_us', to: 'user/static_content#contact_us'
#Routes To Check Admin Side  Request (START)
get '/admin/check_city',to: 'user/static_content#check_city'
get '/admin/check_category',to: 'user/static_content#check_category'
#Routes To Check Admin Side  Request (END)

get '/users/edit_profile',to: 'user/users#edit_profile'
put '/users/update_profile',to: 'user/users#update_profile' 

#Routes to see more and see less in Activity
 get '/user/activity/read_more',to: 'user/activities#read_more'
 get '/user/activity/read_less',to: 'user/activities#read_less'

 namespace :user do
  resources :passes
  resources :bookings
  get '/cities' => "users#get_city"
  # get '/passes/index' => "users/passes#index"
   resources :static_content, only: [] do
         collection do
            get 'about_us'
            get 'terms_and_condition'
            get 'tips'
            get 'privacy_policy'
            get 'faq'
            get 'contact_us'
            post 'contact_admin'

         end
      end

    resources :activities, only: [:show , :index] do
    end  
    resources :orders, only: [] do
      collection do
        get 'add_to_cart'
        get 'my_cart'
        get 'my_order_history'
        get 'remove_item'
        get 'order_payment'
        get 'success'
        post 'success'
        post 'error'

      end
    end 
    resources :routes  , only: [] do 
      collection do
        get 'index'
        get 'city_details'
        get 'category_details'
        get 'hop_on_hop_off'
        get 'bus_details'
        get 'get_date_buses'
        post 'bus_booking'
      end
   end
 end
end