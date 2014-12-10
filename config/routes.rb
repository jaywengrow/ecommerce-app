Rails.application.routes.draw do

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
    get 'products/new' => 'products#new', :as => :new_product
    get 'products' => 'products#index', :as => :products
    post 'products' => 'products#create'
    get 'products/:id' => 'products#show', :as => :product
    get 'products/:id/edit' => 'products#edit', :as => :edit_product
    patch 'products/:id' => 'products#update'
    delete 'products/:id' => 'products#destroy'


  
  devise_for :users
  root 'products#index'
  get 'products/kylestore' => 'products#kylestore'
  get 'products/random_product' => 'products#random'

  post 'orders' => 'orders#create'
  get 'orders' => 'orders#new'
  patch 'orders/:id' => 'orders#update', :as => :order

  get 'carted_products' => 'carted_products#index'
  post 'carted_products' => 'carted_products#create'


  # 'item-page/:id' => 'products#show'
 
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
