ImportData::Application.routes.draw do

  resources :imported_data, only: [:new, :create]

  root 'imported_data#new'
  get ':controller(/:action(/:id))', to: redirect('/')

end

