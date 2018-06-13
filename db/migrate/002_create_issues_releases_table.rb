class CreateIssuesReleasesTable < ActiveRecord::Migration
  def self.up
    create_table :issues_releases, :id => false do |t|
      t.references :issue
      t.references :release
    end
  end

  def self.down
    drop_table :issues_releases
  end
end
