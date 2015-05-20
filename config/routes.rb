Rails.application.routes.draw do

  root 'books#index'

  get '/books' => 'books#index', as: 'books'
  get '/books/archive' => 'books#archive', as: 'archive'

  get '/books/:id' => 'books#show', as: 'book'

  ############################################################################  

  get '/login' => 'sessions#new', as: 'login'
  post '/sessions' => 'sessions#create'
  delete '/sessions' => 'sessions#destroy', as: 'logout'

  get '/signup' => 'users#new', as: 'create_account'
  post '/users' => 'users#create'

  ############################################################################

  post '/favorite_books/:book_id' => 'favorite_books#create', as: 'add_favorite_book'
  post '/favorite_authors/:book_id' => 'favorite_authors#create', as: 'add_favorite_author'

  delete '/favorite_books/:book_id' => 'favorite_books#destroy', as: 'delete_favorite_book'
  delete '/favorite_authors/:book_id' => 'favorite_authors#destroy', as: 'delete_favorite_author'

  ############################################################################  
  
  get '/books/:book_id/comments/new' => 'comments#new', as: 'new_comment'
  post '/books/:book_id/comments' => 'comments#create', as: 'create_comment'

  get '/books/:book_id/comments/' => 'comments#index'
  get '/comments/:id' => 'comments#show', as: 'comment'

  get '/comments/:id/edit' => 'comments#edit', as: 'edit_comment'
  patch '/comments/:id' => 'comments#update', as: 'update_comment'

  delete '/comments/:id' => 'comments#destroy', as: 'delete_comment'

  ############################################################################

  get '/reviewers/:id' => 'reviewers#show', as: 'reviewer'

end
