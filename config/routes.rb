Rails.application.routes.draw do

  resources :users, only: [:update, :index]
  
  get 'search' => 'notes#search'

  get 'flashcards' => 'flashcards#index'
  
  get 'trending' => 'notes#trending'

  resources :stacks

  resources :notes do
    resources :flashcards, only: [:create, :destroy]
  end
  
  devise_for :users

  post 'notes/:note_id/up-vote' => 'votes#up_vote', as: :note_up_vote
  post 'notes/:note_id/down-vote' => 'votes#down_vote', as: :note_down_vote

  get 'about' => 'welcome#about'

  root 'welcome#index'

end
