class AddDurationAndDifficultyLevelToPresentations < ActiveRecord::Migration
  def self.up
    add_column :presentations, :duration, :integer
    add_column :presentations, :difficulty_level, :string
  end

  def self.down
    remove_column :presentations, :difficulty_level
    remove_column :presentations, :duration
  end
end
