PublishingHackathon13::Application.routes.draw do
  root :to => 'welcome#index'
  match 'auth/:provider/callback', to: 'session#create'
  resources :users
  resources :polls, :only => [:index, :show, :new, :create]
  resources :responses
  resources :suggestions
  get '/login/'   =>'session#new'
  post '/login'   =>'session#create'
  delete '/login' =>'session#destroy'
end
