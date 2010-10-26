# == Schema Information
# Schema version: 20101020132438
#
# Table name: language_methods
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  body       :string(255)
#  initial    :string(255)
#  created_at :datetime
#  updated_at :datetime
#  deleted_at :datetime
#

class LanguageMethod < ActiveRecord::Base
  has_many :language_habtm_language_methods
  has_many :languages, :through => :language_habtm_language_methods, :uniq => true

public
  def terminal
    body[body.length - 1 , 1]
  end

end
