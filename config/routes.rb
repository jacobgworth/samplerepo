Mohhaiti::Application.routes.draw do
  
  match "/blog/feed.xml" => "posts#rss", :action => 'rss'
  match "/bluetoblock" => "projects#bluetoblock"
  match "/projects/5" => "projects#bluetoblock"
  resources :news

  resources :videos

  resources :events

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
  
  resources :blog, :controller => "posts"
  
  resources :villages, :controller => "communities"
  
  get "home/index"
  
  #################301 Redirects from old site############################
  

  match "/about_moh" => redirect("/about_us")
  match "/about_moh/history" => redirect("/")
  match "/about_moh/in_the_news/" => redirect("/press")  
  match "/about_moh/staff/:any" => redirect("/meet_our_staff")
  match "/about_moh/staff/" => redirect("/meet_our_staff")
  match "/about_moh/vision_and_resolution/" => redirect("/vision_mission_resolution")
  match "/about_moh/our_progress_in_haiti/" => redirect("/what-we-do")
  match "/about_moh/haiti_info/" => redirect("/about_haiti")
  match "/about_moh/contact_us/" => redirect("/contact_us")
  match "/about_moh/privacy_policy/" => redirect("/privacy")
  match "/about_moh/videos/" => redirect("/videos")
  match "/about_moh/what_we_believe" => redirect("/")
  
  match "/blog" => redirect("/posts")
  
  match "/contact-us" => redirect("/contact_us")
  
  match "/get_involved/" => redirect("/take-action")
  match "/get_involved/donations" => redirect("/take-action")
  match "/get_involved/partners_of_hope" => redirect("/partner_of_hope")
  match "/get_involved/child_sponsorships/faq/" => redirect("/sponsor_faq")
  match "/get_involved/child_sponsorships/cs_store/" => redirect("/gift_store")
  match "/get_involved/child_sponsorships/" => redirect("/child-sponsorship")
  match "/get_involved/child_sponsorships/orphan_sponsorship" => redirect("/child-sponsorship")
  match "/get_involved/child_sponsorships/student_sponsorship" => redirect("/child-sponsorship")
  match "/get_involved/church_partnerships" => redirect("/church_partner")
  match "/get_involved/church_partnerships/vision_trip_dates" => redirect("/vision_trip")
  match "/get_involved/employment_opportunities/" => redirect("/about_us")
  match "/get_involved/events/" => redirect("/events")
  match "/get_involved/internships/" => redirect("/internships")
  match "/get_involved/mission_trips/" => redirect("/mission_trips")
  match "/get_involved/mission_trips/faq1" => redirect("/trip_faqs")
  match "/get_involved/mission_trips/preparing_for_your_trip/" => redirect("/preparing_for_mission_trips")
  match "/get_involved/mission_trips/trip_costs" => redirect("/trip_costs")
  match "/get_involved/mission_trips/trip_dates" => redirect("/trip_dates")
  match "/get_involved/prayer_needs/" => redirect("/take-action")
  
  match "/news" => redirect("/press")
  match "/take-the-plunge" => redirect("/mission_trips")
  
  match "/what_we_do/3cords/" => redirect("/three_cords")
  match "/what_we_do/church_advancement/" => redirect("/church_advancement")
  match "/what_we_do/education1/" => redirect("/education")
  match "/what_we_do/education1/christian_curriculum/" => redirect("/mwen_kapab")
  match "/what_we_do/future_plans/" => redirect("/projects")
  match "/what_we_do/future_plans/:any" => redirect("/projects")
  match "/what_we_do/haiti_one/" => redirect("/haiti_one")
  match "/what_we_do/medical_care/" => redirect("/health_care")
  match "/what_we_do/medical_care/prosthetics_lab" => redirect("/prosthetics")
  match "/what_we_do/medical_care/community_health_program" => redirect("/community_health")
 
  match "/what_we_do/moh_500/" => redirect("/projects/5")
  match "/what_we_do/nutrition/" => redirect("/nutrition")
  match "/what_we_do/orphan_care/" => redirect("/orphan_care")
  match "/what_we_do/" => redirect("/what-we-do")
  
  
  
  ########################################################################
  
  get "page/newsletter_thank_you"
  match "/newsletter_thank_you" => "page#newsletter_thank_you"
  
  get "page/sitemap"
  match "/sitemap" => "page#sitemap"
  
  get "page/what_we_do"
  match "/what-we-do" => "page#what_we_do"
  
  get "page/about_us"
  match "/about_us" => "page#about_us"
  
  get "page/contact_us"
  match "/contact_us" => "page#contact_us"
  
  get "page/videos"
  match "/videos" => "page#videos"
  
  get "page/haiti_one"
  match "/haiti_one" => "page#haiti_one"
  
  get "page/mission_trips"
  match "/mission_trips" => "page#mission_trips"
    
  get "page/about_haiti"
  match "/about_haiti" => "page#about_haiti"
    
  get "page/orphan_care"
  match "/orphan_care" => "page#orphan_care"
  match "/orphan-care" => "page#orphan_care"
  
  get "page/education"
  match "/education" => "page#education"
  
  get "page/health_care"
  match "/health_care" => "page#health_care"
  
  get "page/three_cords"
  match "/three_cords" => "page#three_cords"
    
  get "page/meet_our_staff"
  match "/meet_our_staff" => "page#meet_our_staff"
  
  get "page/clinic"
  match "/clinic" => "page#clinic"
  
  #get "page/our_story"
  #match "/our_story" => "page#our_story"
  
  get "page/community_health"
  match "/community_health" => "page#community_health"
 
  get "page/prosthetics"
  match "/prosthetics" => "page#prosthetics"
     
  #get "page/internships"
  #match "/internships" => "page#internships"
  
  get "page/privacy"
  match "/privacy" => "page#privacy"
  
  #get "page/financial_info"
  #match "/financial_info" => "page#financial_info"
  
  get "page/press"
  match "/press" => "page#press"
  
  get "page/school_of_hope"
  match "/school_of_hope" => "page#school_of_hope"
  
  get "page/mwen_kapab"
  match "/mwen_kapab" => "page#mwen_kapab"
  
  #get "page/vision_mission_resolution"
  #match "/vision_mission_resolution" => "page#vision_mission_resolution"
  
  get "page/join_our_team"
  match "/join_our_team" => "page#join_our_team"
  
  get "page/partner_of_hope"
  match "/partner_of_hope" => "page#partner_of_hope"
  
  get "page/nutrition"
  match "/nutrition" => "page#nutrition"
  
  #get "page/medical_mission_trips"
  #match "/medical_mission_trips" => "page#medical_mission_trips"
     
  get "page/mission_trip_experinces"
  match "/mission_trip_experinces" => "page#mission_trip_experiences"
  
  #is this deprecated? seems to be /experiences now
  get "page/mission_trip_experiences"
  match "/mission_trip_experiences" => "page#mission_trip_experiences"
  #end possible deprecation
  
  get "page/image_submit"
  match "/page/image_submit" => "page#image_submit"
   
  #get "page/preparing_for_mission_trips"
  #match "/preparing_for_mission_trips" => "page#preparing_for_mission_trips"
     
  get "page/request_info"
  match "/request_info" => "page#request_info"
     
  #get "page/trip_costs"
  #match "/trip_costs" => "page#trip_costs"
     
  #get "page/trip_dates"
  #match "/trip_dates" => "page#trip_dates"
     
  #get "page/trip_faqs"
  #match "/trip_faqs" => "page#trip_faqs"
        
  get "page/communities_impacted"
  match "/communities_impacted" => "page#communities_impacted"
        
  get "page/church_partner"
  match "/church_partner" => "page#church_partner"
        
  get "page/vision_trip"
  match "/vision_trip" => "page#vision_trip"
    
  get "page/downloads"
  match "/downloads" => "page#downloads"
  
  #get "page/faq"
  #match "/faq" => "page#faq"
    
  get "page/make_donation"
  match "/make_donation" => "page#make_donation"
    
  get "page/be_a_partner"
  match "/be_a_partner" => "page#be_a_partner"
 
  get "page/volunteer"
  match "/volunteer" => "page#volunteer"   
    
  get "page/share_photos"
  match "/share_photos" => "page#share_photos"
    
  get "page/event"
  match "/event" => "page#event"
          
  get "page/sponsor_child"
  match "/sponsor_child" => "page#sponsor_child"
          
  get "page/learn_sponsor"
  match "/learn_sponsor" => "page#learn_sponsor"
          
  #get "page/sponsor_faq"
  #match "/sponsor_faq" => "page#sponsor_faq"
          
  get "page/gift_store"
  match "/gift_store" => "page#gift_store"
          
  get "page/write_my_child"
  match "/write_my_child" => "page#write_my_child"
      
  get "page/console"
  match "/console" => "page#console"
  
  get "advancement/index"
  match "/church_advancement" => "Advancement#index"
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
