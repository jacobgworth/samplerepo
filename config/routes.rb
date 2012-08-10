Mohhaiti::Application.routes.draw do

  resources :categories

  get "category/index"

  get "category/show"

  get "category/update"

  resources :posts

  resources :experiences

  resources :partners

  root :to => 'home#index'

  resources :contents

  resources :tags

  resources :updates

  get "log_in" => "sessions#new", :as => "log_in"
  get "log_out" => "sessions#destroy", :as => "log_out"
  
  #get "sessions/new"

  resources :users

  resources :projects

  resources :communities
  
  resources :sessions

  get "home/index"
  
  get "page/what_we_do"
  match "/what-we-do" => "page#what_we_do"
  
  get "page/haiti_one"
  match "/haiti_one" => "page#haiti_one"
    
  get "page/orphan_care"
  match "/orphan_care" => "page#orphan_care"
  
  get "page/education"
  match "/education" => "page#education"
  
  get "page/console"
  match "/console" => "page#console"
  
  get "advancement/index"
  match "/church-advancement" => "Advancement#index"
  
  get "sponsorship/index"
  match "/child-sponsorship" => "Sponsorship#index"
  
  get "take_action/index"
  match "/take-action" => "TakeAction#index"
  
  get "connected/index"
  match "/stay-connected" => "Connected#index"
  
  #For the custom Content model URLs
  match '*path/:url' => "Contents#show"
  match '*path/:url/delete' => "Contents#delete"
  match '/:url' => "Contents#show"
  
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
  

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
