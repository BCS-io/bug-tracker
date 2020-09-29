class Account < ApplicationRecord
  enum role: {user: 0, admin: 1}, _prefix: :role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
    :rememberable, :validatable

  has_many :leads, class_name: "Project", foreign_key: "lead_id", inverse_of: "lead", dependent: :destroy
  has_many :issues, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :username, presence: true, uniqueness: true
  validates :role, inclusion: {in: roles.keys}
end
