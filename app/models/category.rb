class Category < ApplicationRecord
  validates_presence_of :title

  has_many :articles, dependent: :destroy

  def self.with_articles
    all.includes(:articles).map do |category|
      {
        title: category.title,
        articles: category.articles
      }
    end
  end

  def self.preview_mode
    all.includes(:articles).map do |category|
      {
        title: category.title,
        articles: category.articles.limit(3)
      }
    end
  end
end
