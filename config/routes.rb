ImageHosting::Application.routes.draw do
  devise_for :users
  
  match 'admin' => 'admin#index'
  match 'admin/create' => 'admin#create', via: :post
  match 'images/:id' => 'image#show'
  root to: 'admin#root'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
