require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web, at: '/sidekiq'

  namespace :api do
    namespace :v1 do
      get '/bible/:translation_code/:book_name/:chapter_id/:verse_id', to: 'bible#index'
      post '/bible/:translation_code/:book_name/:chapter_id/:verse_id/read', to: 'bible#read'
    end
  end
end
