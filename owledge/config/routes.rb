Rails.application.routes.draw do
  resources :notebooks 

  root :to => redirect('/notebooks')

  get 'users/new' => 'users#new' as :new_user
  post 'users' => 'users#create'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
