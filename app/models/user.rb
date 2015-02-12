class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  scope :excluding, -> (*users) { where(["users.id NOT IN (?)", (users.flatten.compact.map(&:id) << 0)]) }

  def name
    [first_name, last_name].join(" ")
  end
end
