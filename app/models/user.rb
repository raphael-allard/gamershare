class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :games, foreign_key: :owner_id, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :username, :city, presence: true
  validates :username, uniqueness: true
end
