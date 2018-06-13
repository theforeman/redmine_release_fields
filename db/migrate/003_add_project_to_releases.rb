class AddProjectToReleases< ActiveRecord::Migration
  def self.up
    add_column :releases, :project_id, :integer, :null => true, :default => nil
  end

  def self.down
    remove_column :releases, :project_id
  end
end
