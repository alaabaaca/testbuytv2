BuytCanTho::Application.routes.draw do


  devise_for :users

  resources :diemtrentuyens  do
    member do
      get 'diemtrentuyens_android'
    end
  end


  resources :cokhungthoigians     do
    member do
      get :cokhungtgs_android
    end
  end


  resources :khungthoigians


  resources :gopies  do
    collection do
      post 'gopies_android'
    end
  end


  resources :chuyens do
    collection do
      get 'chuyens_android'
    end
    member do
      get :chuyens_tuyen_android
      get :chuyens_congty_android
      get :chuyens_tram_android
    end
  end


  resources :taikhoans    do
    collection do
      post 'login'
      post 'authen'
    end
  end


  resources :congties


  resources :diquatrams   do
    member do
      get :diquatrams_android
      get :diquatrams_tuyen_android
    end
  end


  resources :tramdungs  do
    collection do
      get 'tramdungs_android'
    end
  end


  resources :tuyens   do
    collection do
      get 'tuyens_android'
    end
    member do
      get :tuyens_tram_android
      get :tuyens_timtheoma_android
      get :tuyens_timtheotramdau_android
      get :tuyens_timtheotramcuoi_android
    end
  end


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
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
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
  #       get 'recent', :on => :collection
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
   root :to => 'trangchu#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
