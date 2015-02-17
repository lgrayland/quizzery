class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, 
  :omniauthable, :omniauth_providers => [:facebook]

  mount_uploader :user_image, UserImageUploader

  has_many :created_quizzes, foreign_key: :owner_id, class_name: 'Quiz'
  has_many :created_games, foreign_key: :creator_id, class_name: 'Game'
  has_many :created_questions, foreign_key: :creator_id, class_name: 'Question'
  has_many :participations
  has_many :participating_games, through: :participations, source: :game

  scope :excluding, -> (*users) { where(["users.id NOT IN (?)", (users.flatten.compact.map(&:id) << 0)]) }

  before_validation :set_role

  def set_role
    self.role ||= :user
  end

  def role?(role_to_compare)
    self.role.to_s == role_to_compare.to_s
  end

  def accessible_games
    (participating_games + created_games).uniq
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
      user.nick_name = auth.info.name   # assuming the user model has a name
      user.image = auth.info.image # assuming the user model has an image
    end
  end

  def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
end
