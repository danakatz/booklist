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

  get '/favorite_books/:user_id' => 'favorite_books#index', as: 'favorite_books'
  post '/favorite_books/:book_id' => 'favorite_books#create', as: 'add_favorite_book'
  delete '/favorite_books/:book_id' => 'favorite_books#destroy', as: 'delete_favorite_book'

  get '/favorite_authors/:user_id' => 'favorite_authors#index', as: 'favorite_authors'
  post '/favorite_authors/:book_id' => 'favorite_authors#create', as: 'add_favorite_author'
  delete '/favorite_authors/:book_id' => 'favorite_authors#destroy', as: 'delete_favorite_author'


  ############################################################################  
  
  get '/books/:book_id/comments/new' => 'comments#new', as: 'new_comment'
  post '/books/:book_id/comments' => 'comments#create', as: 'create_comment'

  get '/books/:book_id/comments/' => 'comments#index'
  get '/comments/:comment_id' => 'comments#show', as: 'comment'

  get '/comments/:user_id/:comment_id/edit' => 'comments#edit'
  patch '/comments/:user_id/:comment_id' => 'comments#update'

  delete '/comments/:user_id/:comment_id' => 'comments#destroy'

  get '/authors/:author_id/books' => 'authors#show', as: 'author_books'

  ############################################################################

  get '/reviewers/:id' => 'reviewers#show', as: 'reviewer'

end
