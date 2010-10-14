class RubyMethod < ActiveRecord::Base
  has_many :ruby_class_habtm_ruby_methods
  has_many :ruby_classes, :through => :ruby_class_habtm_ruby_methods, :uniq => true

public

  def self.get_random
    RubyMethod.all.sort_by{|m| rand}.first
  end

  def self.get_next_question(answer)
    RubyMethod.find_all_by_initial(answer[answer.length - 1, 1]).sort_by{|m| rand}.first
  end

end
