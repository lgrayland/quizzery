class Question < ActiveRecord::Base

  has_many :answerchoices
  belongs_to :type

  scope :excluding, -> (*questions) { where(["questions.id NOT IN (?)", (questions.flatten.compact.map(&:id) << 0)]) }
  
end
