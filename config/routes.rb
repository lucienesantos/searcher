Rails.application.routes.draw do
  root to: "home#index"
  get "search" => "searches#search"
  get "statistics" => "searches#index"
  delete "statistics" => "searches#destroy_all"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
