Rails.application.routes.draw do
  get 'about_us/index'
  root "home#index"
  resources :schools
  resources :students
  resources :teachers
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
