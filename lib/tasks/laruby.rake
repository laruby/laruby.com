require 'twitter'

namespace :twitter do
  desc "Find tweets that can be turned into resources"
  task(:import_resources => :environment) do
    Twitter::Search.new.to('laruby').each do |r|
      if (/#resources?/.match(r.text)) and (/(https?:\/\/[^ ]+)/.match(r.text))
        begin
          response = Net::HTTP.get_response(URI.parse($1))
          if (["200", "301", "302"].include?(response.header.code))
            url = response.header["location"] || $1
            unless Resource.exists?(:link => url)
              resource = Resource.new
              resource.link = url
              user = User.find_by_twitter_id(r.from_user)
              resource.submitted_by = user.id unless user.nil?
              # Only automatically approve submitted resources from trusted users
              resource.approved = (user.nil?) ? false : true
              resource.description = r.text
              resource.save
            end
          end
        rescue
          #ignore exceptions, if it doesn't resolve we don't want it
        end
      end
    end
  end
end
