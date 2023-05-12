class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nick_name, presence: true
  VALID_PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  # Add more validations according to your requirements
  validates :first_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :last_name, presence: true, format: { with: /\A[ぁ-んァ-ン一-龥々]+\z/ }
  validates :first_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :last_name_kana, presence: true, format: { with: /\A[ァ-ヶー－]+\z/ }
  validates :birthday, presence: true

  # Add any other validations that might be required for your application
end
