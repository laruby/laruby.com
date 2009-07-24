class CreateTalks < ActiveRecord::Migration
  def self.up
    create_table :talks do |t|
      t.string :subject
      t.text :description
      t.integer :submitted_by
      t.string :slides_link
      t.datetime :given_on

      t.timestamps
    end
  end

  def self.down
    drop_table :talks
  end
end
