class LanguageMethod < ActiveRecord::Base
  belongs_to :language

public
  def terminal
    body[body.length - 1 , 1]
  end

end
