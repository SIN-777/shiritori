class CreateRubyClasses < ActiveRecord::Migration
  def self.up
    create_table :ruby_classes do |t|
      t.string :name
      t.timestamps
      t.datetime :deleted_at
    end
    add_index :ruby_classes, :deleted_at
  end

  def self.down
    drop_table :ruby_classes
  end
end
