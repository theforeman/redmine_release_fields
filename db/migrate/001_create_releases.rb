class CreateReleases < ActiveRecord::Migration
  def change
    create_table :releases do |t|
      t.integer :id
      t.string :name
      t.string :status
      t.timestamps
    end
  end
end
