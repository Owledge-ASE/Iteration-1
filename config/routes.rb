Rails.application.routes.draw do
  devise_for :users, path: '', skip: [:sessions, :registrations]
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session
    post 'login', to: 'devise/sessions#create', as: :user_session
    get 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
    get 'register', to: 'devise/registrations#new', as: :new_user_registration
    post 'register', to: 'devise/registrations#create', as: :user_registration
    get 'profile/edit', to: 'devise/registrations#edit', as: :edit_user_registration
    delete 'register', to: 'devise/registrations#destroy', as: :destroy_user
    put 'profile/edit', to: 'devise/registrations#update', as: :update_user
  end

  resources :notebooks do
    resources :comments
    get 'search', to: 'notebooks#search', as: :search_notebooks
    get 'likes', to: 'notebooks#likes', as: :likes
  end

  root to: redirect('/notebooks')
  get 'notebook-sort', to: 'notebooks#sort', as: :notebooks_sort
  get 'notebook-search', to: 'notebooks#search', as: :notebooks_search

  get 'profile', to: 'users#show', as: :current_user_profile
  get 'profile/:id', to: 'users#show', as: :user_profile

  get 'login', to: 'devise/sessions#new'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
