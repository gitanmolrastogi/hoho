Rails.application.routes.draw do
  devise_for :users ,:controllers => { sessions: 'user/sessions',registrations: 'user/registrations' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root :to=>'user/home#dashboard'
 get  '/users/check_email', to: 'user/users#check_email'
 get  '/users/find_email', to: 'user/users#find_email'
 
 namespace :user do
 resources :static_content, only: [] do
       collection do
          get 'about_us'
          get 'contact_us'
          get 'terms_and_condition'
          get 'privacy_policy'
       end
    end
end
end