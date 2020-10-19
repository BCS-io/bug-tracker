class Issues::Event < ApplicationRecord
  belongs_to :issue
  belongs_to :eventable, polymorphic: true

  validates :action, presence: true
end
