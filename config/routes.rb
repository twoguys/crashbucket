Crashreportapp::Application.routes.draw do |map|

  # session routes
  match 'signin'  =>  'user_sessions#new',      :as => :login  
  match 'signout' =>  'user_sessions#destroy',  :as => :logout
  match 'signup'  =>  'beta_invites#new',       :as => :signup
  match 'about'   =>  'pages#about',            :as => :about
  match 'terms'   =>  'pages#terms',            :as => :terms
  
  resources :users
  resources :user_sessions
  
  resources :apps do
    member do
      get :info
      get :closed
    end
    resources :reports do
      member do
        get :close
        get :open
      end
    end
  end
  
  namespace :api do
    resources :apps do
      resources :reports
    end
  end
  
  namespace :admin do
    match '/'     => 'dashboard#index',       :as => :dashboard
    resources :beta_invites, :path => 'invites' do
      member do
        get :deliver
      end
    end
  end
  
  resources :beta_invites,  :path => "invites"
  match 'beta/:code'     => 'users#new',         :as => 'invite_code'
  
	#root
  match '/'                 => 'pages#about',       :as => 'root'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get :short
  #       post :toggle
  #     end
  #
  #     collection do
  #       get :sold
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get :recent, :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
