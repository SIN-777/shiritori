class LanguageHabtmLanguageMethod < ActiveRecord::Base
  belongs_to :language, :dependent => :destroy
  belongs_to :language_method, :dependent => :destroy
end
