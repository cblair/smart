Smart::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}
  get 'pages/home' => 'pages#home'
  resources :pages
  resources :page_chunks
  #TODO: fix when the Mercury saveURL works.
  #resources :page_chunks do
  #  member { put :mercury_update }
  #end

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  #root 'home#index'
  root 'pages#home'

  mount Mercury::Engine => '/'
  #Mercury::Engine.routes
  #resources :page_chunks do
  #  member { post :update }
  #end
  #put '/' => 'page_chunks#update'

  get 'notifications/push_twitter/:id' => 'notifications#push_twitter', as: :push_twitter
  get 'notifications/push_facebook/:id' => 'notifications#push_facebook', as: :push_facebook
  resources :notifications
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

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
