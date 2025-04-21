# config/routes.rb
Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  
  root 'dunks#index'
  get 'about', to: 'about#index', as: :about
end