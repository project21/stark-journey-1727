Deals::Application.routes.draw do
  resources :comments
post "deal/new"
  get "view/show"
  get "category/index"
   get "category/clothing"
  get "category/electro"
  get "category/health"
  get "category/entertain"
  get "category/restaurant"
  get "category/activity"
  
  get "deal/index"
  post "deal/create"
  get "deal/new"

  post "deal/vote_up"
  get "deal/show"

  get "deal/all_cities"

  get "deal/new_deals"

  get "deal/retailers"

  get "deal/search"
  
  get "deal/questions"

  get "city/index"

  get "home/index"

  get "home/new"

  get "home/search"

  get "home/cities"

  get "home/retailers"

  get "home/new_deals"
 
  post "home/next"
 get 'deal/id'  
  devise_for :users
match '/comment/index' => 'comments#index' ,:via=>:get
match 'deal/city/'  => "deal#city", :via=>:get
match 'deals/:id'  => "deal#show", :via=>:get
match 'home/next'  => "deal#show" 
resources :city,:store,:vote ,:category
match "category/electro" => 'category#electro'
match "category/health" => 'category#health'
match "category/activity" => 'category#activity'
match "category/restaurant" => 'category#restaurant'
match "category/clothing" => 'category#clothing'
match "category/entertain" => 'category#entertain'
match "deal/retailers" => 'deal#retailer_create'
resources :deals,:controller=>"deal" do

   collection do
    get :show, :as => :show
  end

  member do
    post :vote_up
    post :vote_down
  end
end

 
resources :cities do
 resources :deals  
 end 

# resources :deals do
# resources :comments  
# end 

 resource :category do
  collection do
    get :electro
  end
end


   

root :to => "home#index"
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
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
