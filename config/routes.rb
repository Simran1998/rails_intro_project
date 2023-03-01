Rails.application.routes.draw do
  get "about_us/index"
  root "home#index"

  resources :students
  resources :teachers

  resources :schools, only: %i[index show] do
    collection do
      get "search"
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
