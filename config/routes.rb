Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root "ideas#index"
  resources :ideas
  
  resources :users do
    resources :relationships, only: [:create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :relationships, only: [:destroy]
  #post '/users/:id/relatioships', to: 'relationships#create' , as: :create_relatioship
  #get '/users/:id/relationships', to: 'users#show' 
  
end
