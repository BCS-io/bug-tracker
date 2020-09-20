class Project < ApplicationRecord
  has_many :issues, dependent: :destroy
  belongs_to :lead, class_name: "Account"

  validates :name, length: {minimum: 3}, uniqueness: true
  validates :key, length: {minimum: 2}, uniqueness: true
end
