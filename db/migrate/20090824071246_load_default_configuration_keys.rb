require 'active_record/fixtures'
class LoadDefaultConfigurationKeys < ActiveRecord::Migration
  def self.up
    down
    directory = File.join(File.dirname(__FILE__), "data")
    Fixtures.create_fixtures(directory, "configurations")
  end

  def self.down
    User.delete_all
  end
end
