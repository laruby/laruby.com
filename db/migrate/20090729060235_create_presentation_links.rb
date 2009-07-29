class CreatePresentationLinks < ActiveRecord::Migration
  def self.up
    create_table :presentation_links do |t|
      t.integer :presentation_id
      t.string :link

      t.timestamps
    end
  end

  def self.down
    drop_table :presentation_links
  end
end
