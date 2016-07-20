Rails.application.routes.draw do

  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root 'static#home'

  get '/survey' => 'static#survey'
  get '/contact' => 'static#contact'
  get '/checklist' => 'static#checklist'
  resources :subscriptions, only: [:create]

  get '/resources', to: redirect('/resources/search')
  get '/resources/search' => 'resources#new'
  post '/resources/search' => 'resources#search'
  get '/resources/search/:id' => 'resources#results'
  get '/resources/:id' => 'resources#show'

  comfy_route :cms_admin, :path => '/cms'
  comfy_route :cms, :path => '/', :sitemap => false # Make sure this routeset is defined last

end
