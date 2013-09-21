AskDeebs::Application.routes.draw do
  root 'welcome#index'

  get 'signup', to: 'users#new'
  get 'signin', to: 'sessions#signin'
  get 'auth', to: 'sessions#auth'
  get 'logout', to: 'sessions#logout'

  get 'vote', to: 'answers#vote'

  resources :questions do
    resources :answers, :except => [:index, :show]
  end

  resources :users

  resources :tags, :only => [:show]

  post 'questions/:id/follow', to: 'questions#follow', as: "question_follow"
  post 'questions/:id/unfollow', to: 'questions#unfollow', as: "question_unfollow"

end
