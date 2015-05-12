Rails.application.routes.draw do
  
  get '/comments/new' => 'comments#new', as: 'new_comment'
  post '/comments' => 'comments#create', as: 'create_comment'

  get '/comments/' => 'comments#index', as: 'comments'
  get '/comments/:id' => 'comments#show', as: 'comment'

  get '/comments/:id/edit' => 'comments#edit', as: 'edit_comment'
  patch '/comments/:id' => 'comments#update', as: 'update_comment'

  delete '/comments/:id' => 'comments#destroy', as: 'delete_comment'

  ############################################################################

  root 'books#index'

  get '/books' => 'books#index', as: 'books'
  get '/books/archive' => 'books#archive', as: 'archive'

  get '/books/:id' => 'books#show', as: 'book'

end
