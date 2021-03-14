Rails.application.routes.draw do
  resources :notebooks 

  root :to => redirect('/notebooks')

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
