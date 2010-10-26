class CreateLanguageMethods < ActiveRecord::Migration
  def self.up
    create_table :language_methods do |t|
      t.string :name, :unique => true
      t.string :body
      t.string :initial
      t.timestamps
      t.datetime :deleted_at
    end
    add_index :language_methods, :name
    add_index :language_methods, :body
    add_index :language_methods, :initial
    add_index :language_methods, :deleted_at
  end

  def self.down
    drop_table :language_methods
  end
end
