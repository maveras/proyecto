Rails.application.routes.draw do
  resources :comments
  get 'dashboard/index'

  get 'users/index'

  devise_for :users, controllers: {
      sessions: "users/sessions",
      registrations: 'registrations',
      omniauth_callbacks: "users/omniauth_callbacks" 
  }
  resources :users do  
    resources :user_interests
  end

  get 'landings/welcome'
  
  get 'request_applies/index'

  get  'requests/index'  
  get  'requests/new'
  get  'requests/disabled'
  post 'requests/create'
  get  'requests/:id_request' , to:'requests#show' , as:'requests_detail'
  get  'requests/accepted_request', to:'requests#accepted_request' , as:'accepted_request'


  get  'request_applies/accepted_applies'
  post 'request_applies/apply/:id_request', to:'request_applies#new',  as:'apply'

  #patch 'request_applies/revoke_apply/:id_request/:id_request_apply', to: 'request_applies#revoke_apply', as: 'rechazo'
  patch 'request_applies/rechazo_apply/:id_request_apply', to: 'request_applies#revoke_apply', as: 'rechazo'
  post 'request_applies/accept_apply/:id_request_apply', to: 'request_applies#accept_apply', as: 'accept_apply'


  root 'landings#welcome'

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
  #     #     resources :sales do
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
