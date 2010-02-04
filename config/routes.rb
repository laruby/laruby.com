ActionController::Routing::Routes.draw do |map|
  map.resources :configurations

  map.resources :resources
  map.resources :presentations
  map.resource :account, :controller => "users" do |account|
    account.link_meetup 'link',
                        :action => 'link_meetup_account',
                        :controller => "users"
    account.resend_activation 'resend_activation',
                              :action => 'resend_activation',
                              :controller => "users"
  end
  map.resource :user_session
  map.login 'login',
            :controller => "user_sessions",
            :action => "new"
  map.logout 'logout',
             :controller => "user_sessions",
             :action => "destroy"
  map.activate 'activate/:token',
               :controller => "users",
               :action => "activate",
               :token => nil

  map.root :controller => 'pages',
           :action => 'home'
  map.map '/map/:event_id',
          :controller => 'pages',
          :action => 'map',
          :event_id => nil
  map.events '/events/:past',
             :controller => 'pages',
             :action => 'events',
             :past => nil
  map.static_page ':page',
                  :controller => 'pages',
                  :action => 'show',
                  :page => /about|contact|newbies|community|resources|connect/

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
