Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get '/bible/:translation_code/:book_name/:chapter_id/:verse_id', to: 'bible#index'
    end
  end
end
