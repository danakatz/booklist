Rails.application.routes.draw do
  
  get '/comments/new' => 'comments#new', as: 'new_comment'
  post '/comments' => 'comments#create', as: 'create_comment'

  get '/articles/:id/comments/' => 'comments#index', as: 'comments'
  get '/comments/:id' => 'comments#show', as: 'comment'

  get '/comments/:id/edit' => 'comments#edit', as: 'edit_comment'
  patch '/comments/:id' => 'comments#update', as: 'update_comment'

  delete '/comments/:id' => 'comments#destroy', as: 'delete_comment'

end