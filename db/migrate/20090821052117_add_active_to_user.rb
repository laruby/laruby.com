class AddActiveToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :active, :boolean, :default => false, :null => false 
    add_column :users, :activation_token, :string
  end

  def self.down
    remove_column :users, :activation_token
    remove_column :users, :active
  end
end
