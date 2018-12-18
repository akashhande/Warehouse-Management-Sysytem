Rails.application.routes.draw do
  resources :companies
  get 'reports/Report'
  get 'reports/GenerateReport'
  get 'dashboard/Prediction'
  get 'order_outs/load_information'
  
  resources :profiles
  root :to => 'home#index', :as => :login
  devise_for :users
 # get '/signedinuserprofile' => 'profiles#signedinuserprofile'
  get '/signedinuserprofile' => 'dashboard#index'
  resources :order_outs
  resources :order_ins
  resources :companies
  resources :products
  resources :categories
  resources :sources
  resources :dashboard
 # resources :reports
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
