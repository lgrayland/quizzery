class Question < ActiveRecord::Base

  mount_uploader :question_image, QuestionImageUploader

  has_many :answer_choices
  belongs_to :type
  belongs_to :creator, class_name: "User"

  scope :excluding, -> (*questions) { where(["questions.id NOT IN (?)", (questions.flatten.compact.map(&:id) << 0)]) }
  
end
