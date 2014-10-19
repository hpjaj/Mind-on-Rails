Rails.application.routes.draw do

  resources :users, only: [:update]
  
  get 'search' => 'notes#search'

  resources :notes, :stacks
  
  devise_for :users

  post 'notes/:note_id/up-vote' => 'votes#up_vote', as: :note_up_vote
  post 'notes/:note_id/down-vote' => 'votes#down_vote', as: :note_down_vote

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
