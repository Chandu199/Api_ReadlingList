Rails.application.routes.draw do
namespace :api do 
  resources :books
  resources :genres
  resources :finished_books
end
end
