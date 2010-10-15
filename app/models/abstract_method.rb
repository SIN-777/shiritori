class AbstractMethod < ActiveRecord::Base
  self.abstract_class = true

public

  def self.get_random
    self.all.sort_by{|m| rand}.first
  end

  def self.get_next_question(answer)
    self.find_all_by_initial(answer[answer.length - 1, 1]).sort_by{|m| rand}.first
  end

  def terminal
    body[body.length - 1 , 1]
  end

end
