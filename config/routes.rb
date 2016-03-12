Rails.application.routes.draw do

  get 'teams/new'

  get 'teams/create'

  get 'teams/show'

  devise_for :admin_users, ActiveAdmin::Devise.config
  devise_for :users, :controllers => { registrations: 'registrations' }, path: "accounts", path_names: { 
    sign_in: 'login', 
    sign_out: 'logout', 
    password: 'secret', 
    confirmation: 'verification', 
    unlock: 'unblock', 
    registration: 'profile', 
    sign_up: 'sign_up' 
  }

  #Static pages
  root "static_pages#home"
  get "contact" => "static_pages#contact" 
  get "about" => "static_pages#about" 

  #Dashboard
  get "dashboard" => "dashboard#landing" 

  #PDF Viewer
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  resources :documents
  resources :permissions
  resources :projects
  resources :teams
  resources :users

  #carrierwave file view
  get '/storage/document/doc_file/:id/:basename.:extension' => 'documents#download'
end
