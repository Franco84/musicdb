Rails.application.routes.draw do
  resources :songs
  resources :albums
  resources :artists
  post 'songs/search', to: 'songs#search'
  post 'artists/search', to: 'artists#search'
  post 'albums/search', to: 'albums#search'
  post 'all/search', to: 'songs#search_all'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
