Rails.application.routes.draw do
  resources :tallas, except: :show
  
  resources :categories, except: :show
  # Ruta raíz
  root to: 'productos#index'

  resources :productos 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
