Rails.application.routes.draw do
  get 'hangman/new'
  
devise_scope :member do

  get 'SignUp.asp', to: 'members/registrations#new'
  get 'login.asp', to: 'members/sessions#new'
end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get "HManBuilder.asp", to: "hangman#new"
root to: "welcome#index"
end
