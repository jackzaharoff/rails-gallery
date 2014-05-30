Rails.application.routes.draw do

  root 'home#index'

  match '/about', to: 'home#about', via: :get
  match '/contact', to: 'home#contact', via: :get

  # disable registrations for production, see:
  # http://stackoverflow.com/questions/5370164/disabling-devise-registration-for-production-environment-only
  if Rails.env.production?
    devise_for :users, controllers: {:registrations => 'registrations'}, skip: [:sessions]
  else
    devise_for :users, skip: [:sessions, :registrations]
    as :user do
      get 'users/cancel' => 'devise/registrations#cancel', as: :cancel_user_registration
      get 'register' => 'devise/registrations#new', as: :new_user_registration
      post 'register' => 'devise/registrations#create', as: :user_registration
      get 'edit_profile' => 'devise/registrations#edit', as: :edit_user_registration
      patch 'users' => 'devise/registrations#update'
      put 'users' => 'devise/registrations#update'
      delete 'users' => 'devise/registrations#destroy'
    end
  end

  as :user do
    get 'sign_in' => 'devise/sessions#new', as: :new_user_session
    post 'sign_in' => 'devise/sessions#create', as: :user_session
    delete 'sign_out' => 'devise/sessions#destroy', as: :destroy_user_session
  end

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
