class Game < ActiveRecord::Base

  belongs_to :quiz
  belongs_to :creator, class_name: 'User'
end