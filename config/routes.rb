Rails.application.routes.draw do

  root 'books#index'

  get '/books' => 'books#index', as: 'books'
  get '/books/archive' => 'books#archive', as: 'archive'

  get '/books/:id' => 'books#show', as: 'book'

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
