class CreateLanguageHabtmLanguageMethods < ActiveRecord::Migration
  def self.up
    create_table :language_habtm_language_methods do |t|
      t.column :language_id, :integer, :null => false
      t.column :language_method_id, :integer, :null => false
      t.timestamps
    end
    add_index :language_habtm_language_methods, :language_id
    add_index :language_habtm_language_methods, :language_method_id
  end

  def self.down
    drop_table :language_habtm_language_methods
  end
end
