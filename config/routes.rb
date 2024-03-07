Rails.application.routes.draw do
  resources :tallas, except: :show
  
  resources :categories, except: :show
  # Ruta raíz
  root to: 'productos#index'

  resources :productos 

   #para que podamos estruccturar el codigo como si fuerean carpetas
   namespace :authentication, path: '', as:'' do
    resources :users, only: [:new, :create]
    resources :sessions, only: [:new, :create]
  end
end
