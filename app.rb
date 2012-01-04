require 'rubygems'
require 'compass' # must be loaded before sinatra
require 'rMeetup'
# require 'compass-susy-plugin'

require 'sinatra'
# require 'lib/render_partial'

require 'haml' # must be loaded after sinatra

# Set Sinatra's variables
set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, 'views'
set :public_folder, 'public'
set :haml, {:format => :html5 } # Get with the program. Start using HTML5. Comment out if you're not ready.

configure do
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config.rb'))
  RMeetup::Client.api_key = "422f436d58563429753272236322037"
end

get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  scss(:"stylesheets/#{params[:name]}", Compass.sass_engine_options)
end

get '/' do
  @meetups = RMeetup::Client.fetch(:events,{:group_urlname => "laruby"})
  haml :home
end

# # results = RMeetup::Client.fetch(:events,{:zip => "90210"})
# results.each do |result|
#   result.show
# end
