class AddAdditionalFieldsToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :twitter_id, :string
    add_column :users, :meetup_id, :string
    add_column :users, :role, :integer
    add_column :users, :blog_url, :string
  end

  def self.down
    remove_column :users, :blog_url
    remove_column :users, :role
    remove_column :users, :meetup_id
    remove_column :users, :twitter_id
  end
end
