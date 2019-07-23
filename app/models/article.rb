class Article < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :content, :category
end
