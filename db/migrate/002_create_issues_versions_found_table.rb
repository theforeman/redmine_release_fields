class CreateIssuesVersionsFoundTable < ActiveRecord::Migration
  def self.up
    create_table :issues_versions_found, :id => false do |t|
      t.references :issue
      t.references :version
    end
  end

  def self.down
    drop_table :issues_versions_found
  end
end
