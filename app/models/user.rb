class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :address, dependent: :destroy
  # has_many :items, dependent: :destroy
  # has_many :cards, dependent: :destroy

  validates :nickname, :email, presence: true
  validates :password, presence: true, format: {with: /\A[a-zA-Z0-9]+\z/}
  validates :last_name, :first_name, presence: true, format: {with: /\A[ぁ-んァ-ン一-龥]/}
  validates :last_name_kana, :first_name_kana, presence: true, format: {with: /\A[ァ-ヶー－]+\z/}
  validates :birth_year, :birth_month, :birth_day, presence: true, format: {with: /\A[0-9]+\z/}

end