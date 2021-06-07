Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

  resources :users
  resources :sessions, only: [:create]
  resources :boards
  resources :tasks
  resources :teams
  delete "/team_members/deleter", to: "team_members#deleter"
  resources :team_members, only: [:create, :destroy, :deleter]


end
