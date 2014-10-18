Rails.application.routes.draw do

  resources :users, only: [:update]
  
  get 'search' => 'notes#search'
  
  get 'trending' => 'notes#trending'

  resources :notes, :stacks
  
  devise_for :users

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
