Rails.application.routes.draw do
  
  # get 'users/index'

  # get 'users/show'

  resources :users, only: [:update, :index]
  
  get 'search' => 'notes#search'


  resources :notes, :stacks
  
  devise_for :users

  # get 'notes/index'

  # get 'notes/new'

  # get 'notes/show'

  # get 'stacks/index'

  # get 'stacks/new'

  # get 'stacks/edit'

  # get 'stacks/show'

  # get 'welcome/index'


  get 'about' => 'welcome#about'

  root 'welcome#index'

end
