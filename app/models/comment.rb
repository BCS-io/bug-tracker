class Comment < ApplicationRecord
  has_rich_text :words
  belongs_to :commentable, polymorphic: true
  belongs_to :account
end
