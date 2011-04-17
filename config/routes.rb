ActionController::Routing::Routes.draw do |map|
  
  map.investor_login "investor-login", :controller => "investor_sessions", :action => "new"
  map.investor_logout "investor-logout", :controller => "investor_sessions", :action => "destroy"
  map.admin_login "admin-login", :controller => "admin_sessions", :action => "new"
  map.admin_logout "admin-logout", :controller => "admin_sessions", :action => "destroy"
  
  map.resources :investors
  map.resources :investor_sessions
  map.resources :admins
  map.resources :admin_sessions
  map.resources :subscriptions
  
  map.investor "moonwalk-cardio-investment-information", :controller => "investor_pages", :action => "index"
  map.investor_testimonial "moonwalk-cardio-testimonials", :controller => "investor_pages", :action => "investor_page_2"
  map.investor_package "moonwalk-cardio-investment-package", :controller => "investor_pages", :action => "investor_page_3"
  map.references "moonwalk-cardio-references", :controller => "moonwalk", :action => "references"
  map.media "moonwalk-cardio-media", :controller => "moonwalk", :action => "media"
  map.about "about-moonwalk-cardio", :controller => "moonwalk", :action => "about"
  map.home "anti-gravity-center", :controller => "moonwalk", :action => "index"
  

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller
  
  # Sample resource route with more complex sub-resources
  #   map.resources :products do |products|
  #     products.resources :comments
  #     products.resources :sales, :collection => { :recent => :get }
  #   end

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "moonwalk", :action => "index"
end
