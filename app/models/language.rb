class Language < ActiveRecord::Base
  has_many :language_methods

  def get_random
    language_methods.sort_by{|m| rand}.first
  end

  def get_next_question(answer)
    language_methods.find_all_by_initial(answer[answer.length - 1, 1]).sort_by{|m| rand}.first
  end
end
