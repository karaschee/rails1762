Rails1762::Application.routes.draw do
  namespace :console do
    root 'shows#index'

    get 'signin' => 'sessions#new' # console_signin_url
    delete 'signout' => 'sessions#destroy' # console_signout_url
    resources :sessions, only: [:create]

    resources :shows

    resources :volumes do
      resources :timelines, only: [:index, :create, :destroy]
      member do
        post :update_resource
      end
    end

    resources :shows do
      resources :volumes
    end

    resources :cards

    resources :card_types do
      resources :cards
    end
  end

  resources :shows, only: [:index, :show] do
    resources :volumes, only: [:show]
  end
  resources :cards, only: [:show, :index]
  resources :card_types, only: [:index] do
    resources :cards, only: [:index]
  end
  resources :volumes, only: [:index, :show] do
    # resources :tags, only: [:create]
  end
  resources :tags, only: [:update, :create]

  root 'pages#home'
  get 'search' => 'pages#search', as: :search

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
