Rails.application.routes.draw do

    #para que podamos estruccturar el codigo como si fuerean carpetas
  namespace :authentication, path: '', as:'' do
    resources :users, only: [:new, :create],path: '/register', path_names: {new: '/'}
    resources :sessions, only: [:new, :create, :destroy],path: '/login', path_names: {new: '/'}
  end
  
  resources :carritos, only: [:index, :create, :destroy], param: :producto_id
  resources :favorites, only: [:index, :create, :destroy], param: :producto_id
  resources :users, only: :show, path: '/user', param: :username
  resources :cargos, only: [:index, :new, :create]

  resources :tallas, except: :show
  
  resources :categories, except: :show
  # Ruta raíz
  root to: 'productos#index'

  resources :productos 

  
  
end
