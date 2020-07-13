class Account < ApplicationRecord
  enum role: {user: 0, admin: 1}, _prefix: :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable

  validates :username, presence: true, uniqueness: true
  validates :role, inclusion: {in: roles.keys}
end