class CreateIssuesVersionsFixedTable < ActiveRecord::Migration
  def self.up
    create_table :issues_versions_fixed, :id => false do |t|
      t.references :issue
      t.references :version
    end
  end

  def self.down
    drop_table :issues_versions_fixed
  end
end
