Rails.application.routes.draw do
  resources :directors

  root 'main#index'
  # Routes for the Movie resource:

  # CREATE
  post '/movies' => 'movies#create', as: :movies
  get '/movies/new' => 'movies#new', as: :new_movie

  # READ
  get '/movies' => 'movies#index'
  get '/movies/:id' => 'movies#show', as: :details

  # UPDATE
  patch '/movies/:id' => 'movies#update', as: :movie # expects an argument as movie_path()
  get '/movies/:id/edit' => 'movies#edit', as: :edit_movie # expects an argument as edit_movie_path()

  # DELETE
  delete '/movies/:id' => 'movies#destroy', as: :delete_movie # expects an argument as delete_movie_path()

  #------------------------------
end
