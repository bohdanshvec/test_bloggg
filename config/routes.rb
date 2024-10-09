# frozen_string_literal: true

Rails.application.routes.draw do
  resources :questions # , onli: %i[index new edit create update destroy show]

  # resources :questions, onli: [:ndex, :new, :edit, :create]

  # get '/questions', to: 'questions#index'

  # get '/questions/new', to: 'questions#new'

  # get '/questions/:id/edit', to: 'questions#edit'

  # post '/questions', to: 'questions#create'

  root 'pages#index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
