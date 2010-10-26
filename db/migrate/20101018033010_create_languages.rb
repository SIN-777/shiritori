class CreateLanguages < ActiveRecord::Migration
  def self.up
    create_table :languages do |t|
      t.string :name, :unique => true
      t.timestamps
      t.datetime :deleted_at
    end
    add_index :languages, :name
    add_index :languages, :deleted_at
  end

  def self.down
    drop_table :languages
  end
end
