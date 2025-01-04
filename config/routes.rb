# config/routes.rb
Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  
  root 'dunks#index'
end