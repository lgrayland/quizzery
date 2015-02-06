class GivenAnswer < ActiveRecord::Base
  
  belongs_to :question
  has_one :answerchoice
  belongs_to :participation
  has_one :user, through: :participation

end