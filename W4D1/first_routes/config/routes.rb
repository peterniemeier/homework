Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users
  get 'users', to: 'users#index', as: 'show_users'
  post 'users', to: 'user#create', as: 'create_user'
  get 'users/new', to: 'user#new', as: 'new_user'
  get 'users/:id/edit', to: 'user#edit', as: 'edit_user'
  get 'users/:id', to: 'users#show', as: 'show_user'
  patch 'users/:id', to: 'user#update', as: 'update_user'
  put 'users/:id', to: 'user#update', as: 'put_user'
  delete 'users/:id', to: 'users#destroy', as: 'destroy_user'
  
  
  
end
