# == Schema Information
# Schema version: 20101020132438
#
# Table name: language_habtm_language_methods
#
#  id                 :integer         not null, primary key
#  language_id        :integer         not null
#  language_method_id :integer         not null
#  created_at         :datetime
#  updated_at         :datetime
#

class LanguageHabtmLanguageMethod < ActiveRecord::Base
  belongs_to :language, :dependent => :destroy
  belongs_to :language_method, :dependent => :destroy
end
