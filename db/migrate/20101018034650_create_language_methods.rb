class CreateLanguageMethods < ActiveRecord::Migration
  def self.up
    create_table :language_methods do |t|
      t.string :name
      t.string :body
      t.string :initial
      t.references("language")
      t.timestamps
      t.datetime :deleted_at
    end
    add_index :language_methods, :name
    add_index :language_methods, :body
    add_index :language_methods, :initial
    add_index :language_methods, :deleted_at
    add_index :language_methods, :language_id
  end

  def self.down
    drop_table :language_methods
  end
end
