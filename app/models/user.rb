class User < ApplicationRecord
  PASSWORD_REGEX = /\A[a-z0-9]+\z/.freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates           :email, { uniqueness: true, presence: true, inclusion: { in: ['@'] } }
  validates           :nickname, presence: true
  validates_format_of :encrypted_password, { presence: true, length: { minimum:6 }, with: { PASSWORD_REGEX } }
  validates_format_of :password_confirmation, { presence: true, with: { PASSWORD_REGEX } }

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :name,      presence: true
    validates :last_name, presence: true
  end
  
  with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/ } do
    validates :name_kana,      presence: true
    validates :last_name_kana, presence: true
  end

  validates :birthday, presence: true
end