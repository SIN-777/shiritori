class CreateRubyClassHabtmRubyMethods < ActiveRecord::Migration
  def self.up
    create_table :ruby_class_habtm_ruby_methods do |t|
      t.column :ruby_class_id, :integer, :null => false
      t.column :ruby_method_id, :integer, :null => false
      t.timestamps
    end
    add_index :ruby_class_habtm_ruby_methods, :ruby_class_id
    add_index :ruby_class_habtm_ruby_methods, :ruby_method_id
  end

  def self.down
    drop_table :ruby_class_habtm_ruby_methods
  end
end
