Rails.application.routes.draw do

  root 'static#home'

  get '/survey' => 'static#survey'
  get '/contact' => 'static#contact'
  get '/checklist' => 'static#checklist'
  resources :subscriptions, only: [:create]

  get '/resources' => 'static#resources'

  namespace :start do
    get 'business-plan' => '/static#business_plan'
    get 'finance-your-business' => '/static#finance_your_business'
    get 'find-a-location' => '/static#find_a_location'
    get 'register-your-business' => '/static#register_your_business'
    get 'permits-and-licenses' => '/static#permits_and_licenses'
    get 'building-and-inspections' => '/static#building_and_inspections'
    get 'open-your-business' => '/static#open_your_business'
  end

  comfy_route :cms_admin, :path => '/admin'
  comfy_route :cms, :path => '/', :sitemap => false # Make sure this routeset is defined last

end
