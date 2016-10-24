Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # routing for ssparams crud
  
  get 'ssparams/'=> 'ssparams#index',defaults: {format: :json}
  
  get 'ssparams/:id'=> 'ssparams#show',defaults: {format: :json}

  post 'ssparams/' => 'ssparams#create_or_update', defaults: {format: :json}
  
  delete 'ssparams/:id/delete' => 'ssparams#delete', defaults: {format: :json}
  
  get 'unassigned_params' => 'ssparams#unassigned_params', defaults: {format: :json}
  
  # routing for dictionary
  get 'dictionary/search' => 'dictionary#search',defaults: {format: :json}
  
  # routing for ssmodel crud
  get 'ssmodels' => 'ssmodels#index',defaults: {format: :json}
  
  get 'ssmodel_labels' => 'ssmodels#model_labels',defaults: {format: :json}
  
  post 'ssmodels/' => 'ssmodels#create_or_update',defaults: {format: :json}
  
  delete 'ssmodels/:id/delete' => "ssmodels#delete",defaults: {format: :json}
  
  # route for assigning params to model
  
  post 'ssmodels/assign_params' => "ssmodels#assign_params", defaults: {format: :json}
  get 'ssparams_by_model' => "ssmodels#ssparams_by_model",defaults: {format: :json}
  
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
