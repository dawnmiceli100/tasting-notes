Rails.application.routes.draw do
  root to: 'pages#front'
  get 'home', to: 'tasting_notes#index'

  resources :users, only: [:create]
  resources :sessions, only: [:create]
  resources :wine_types, only: [:show]
  resources :wines, except: [:delete] do
    resources :tasting_notes, only: [:new, :create, :index, :show]
  end  
    
  get '/sign_up', to: 'users#new'
  get '/sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create'
  get '/sign_out', to: 'sessions#destroy'
end
