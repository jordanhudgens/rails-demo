class Article < ApplicationRecord
  belongs_to :user

  validates_presence_of :title, :content, :category

  def self.by_category
    all.group_by(&:category)
  end
end
