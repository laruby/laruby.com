class AddApprovedFlagToResources < ActiveRecord::Migration
  def self.up
    add_column :resources, :approved, :boolean
  end

  def self.down
    remove_column :resources, :approved
  end
end
