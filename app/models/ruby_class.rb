class RubyClass < ActiveRecord::Base
  has_many :ruby_class_habtm_ruby_methods
  has_many :ruby_methods, :through => :ruby_class_habtm_ruby_methods, :uniq => true
end
