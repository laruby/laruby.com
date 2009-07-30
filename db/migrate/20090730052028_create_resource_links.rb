class CreateResourceLinks < ActiveRecord::Migration
  def self.up
    create_table :resource_links do |t|
      t.string :link
      t.text :description
      t.integer :submitted_by

      t.timestamps
    end
  end

  def self.down
    drop_table :resource_links
  end
end
