class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :user_image, UserImageUploader

  has_many :created_quizzes, foreign_key: :owner_id, class_name: 'Quiz'
  has_many :created_games, foreign_key: :creator_id, class_name: 'Game'
  has_many :participations

  scope :excluding, -> (*users) { where(["users.id NOT IN (?)", (users.flatten.compact.map(&:id) << 0)]) }

  def name
    [first_name, last_name].join(" ")
  end
end
