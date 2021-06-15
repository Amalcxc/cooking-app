Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :ideas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "ideas#index"
end
