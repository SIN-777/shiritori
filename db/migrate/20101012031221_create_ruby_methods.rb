class CreateRubyMethods < ActiveRecord::Migration
  def self.up
    create_table :ruby_methods do |t|
      t.string :name
      t.string :initial
      t.string :terminal
      t.timestamps
      t.datetime :deleted_at
    end
    add_index :ruby_methods, :name
    add_index :ruby_methods, :initial
    add_index :ruby_methods, :terminal
    add_index :ruby_methods, :deleted_at
  end

  def self.down
    drop_table :ruby_methods
  end
end
