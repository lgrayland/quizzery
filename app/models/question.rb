class Question < ActiveRecord::Base

  has_many :answer_choices
  belongs_to :type

  scope :excluding, -> (*questions) { where(["questions.id NOT IN (?)", (questions.flatten.compact.map(&:id) << 0)]) }
  
end
