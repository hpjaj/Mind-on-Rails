Rails.application.routes.draw do
  devise_for :users

  resources :notes do
    resources :flashcards, only: [:create, :destroy]
  end

  resources :stacks
  resources :users, only: [:update]

  get 'flashcards' => 'flashcards#index'

  get 'search' => 'notes#search'
  get 'trending' => 'notes#trending'

  get 'admin/users' => 'users#index'
  get 'users/:id', to: 'users#show', as: :userShowPage

  post 'notes/:note_id/down-vote' => 'votes#down_vote', as: :note_down_vote
  post 'notes/:note_id/up-vote' => 'votes#up_vote', as: :note_up_vote

  get 'about' => 'welcome#about'
  root 'welcome#index'
end
