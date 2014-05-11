Rails.application.routes.draw do


  #root routes
  root   'page#index'
  get    'home'           => 'page#index'
  get    'add'            => 'page#add'
  get    'return'         => 'page#return'

  #user_sessions routes
  post   'create_session' => 'user_sessions#create'
  get    'login'          => 'user_sessions#new'
  delete 'logout'         => 'user_sessions#destroy'

  #users routes
  get    'signup'         => 'users#new'
  post   'create_user'    => 'users#create'
  get    'profile'        => 'users#show'
  get    'edit_profile'   => 'users#edit'
  put    'update_profile' => 'users#update'
  patch  'update_profile' => 'users#update'

  #password routes
  resources :passwords, :only => [:new, :create, :edit, :update] 

  resources :groups
  resources :schools

  #members
  resources :members
  get 'add_member' => 'members#new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
