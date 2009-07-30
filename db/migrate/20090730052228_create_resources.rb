class CreateResources < ActiveRecord::Migration
  def self.up
    create_table :resources do |t|
      t.string :link
      t.text :description
      t.integer :submitted_by

      t.timestamps
    end
  end

  def self.down
    drop_table :resources
  end
end
