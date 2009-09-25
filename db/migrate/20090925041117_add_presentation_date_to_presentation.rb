class AddPresentationDateToPresentation < ActiveRecord::Migration
  def self.up
    add_column :presentations, :presentation_date, :date
  end

  def self.down
    remove_column :presentations, :presentation_date
  end
end
