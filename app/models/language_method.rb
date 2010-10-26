class LanguageMethod < ActiveRecord::Base
  has_many :language_habtm_language_methods
  has_many :languages, :through => :language_habtm_language_methods, :uniq => true

public
  def terminal
    body[body.length - 1 , 1]
  end

end
