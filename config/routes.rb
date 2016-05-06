Rails.application.routes.draw do
  
  
  devise_for :users 
    root 'welcome#index'
    
  
    
     get 'home' => 'homes#home'
     
#     devise_scope :user do
#   get 'user_id', to: 'devise/sessions#new', as: :login
# end
     
     get ':id/sell_fame'  => 'sell_fames#profile',  as: 'sell_fame'
    
     get ':id/get_fame'  => 'get_fames#profile' , as: 'get_fame'
     
    get ':id/get_fame/info'  => 'get_fames#view' , as: 'get_fame_info'
     
     
     get  ':id' => 'users#show'
     
     
#         resources :users,  only: [:show, :index ] do
   
#   end
   
     resources :get_fames, only: [:create, :destroy ] 
     
     resources :ventures
     
     
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
