Rails.application.routes.draw do
  resources :doctrees, :folders, :doc_permissions, :projects, :teams, :documents, :users
  resources :projects do
    resources :documents, to: 'documents#show'
    resources :folders, to: 'projects#folder'
  end

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

  #Dashboard
  get "dashboard" => "dashboard#index" 

  #PDF Viewer
  mount PdfjsViewer::Rails::Engine => "/pdfjs", as: 'pdfjs'

  #carrierwave file view
  get '/storage/document/doc_file/:id/:basename.:extension' => 'documents#download'
end
