PublishingHackathon13::Application.routes.draw do
  root :to => 'welcome#index'
  match 'auth/:provider/callback', to: 'session#create'
  resources :users
  get '/login/'   =>'session#new'
  post '/login'   =>'session#create'
  delete '/login' =>'session#destroy'
end
