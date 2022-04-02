class Blog < ApplicationRecord
  validates :title, presence: true
  validates :author_type, presence: true
  has_rich_text :content
end
