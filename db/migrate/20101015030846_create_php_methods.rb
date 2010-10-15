class CreatePhpMethods < ActiveRecord::Migration
  def self.up
    create_table :php_methods do |t|
      t.string :name
      t.string :body
      t.string :initial
      t.timestamps
      t.datetime :deleted_at
    end
    add_index :php_methods, :name
    add_index :php_methods, :body
    add_index :php_methods, :initial
  end

  def self.down
    drop_table :php_methods
  end
end
