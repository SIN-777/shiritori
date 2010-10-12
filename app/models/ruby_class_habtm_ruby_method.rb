class RubyClassHabtmRubyMethod < ActiveRecord::Base
  belongs_to :ruby_class, :dependent => :destroy
  belongs_to :ruby_method, :dependent => :destroy
end
