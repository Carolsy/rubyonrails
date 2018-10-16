class Article < ActiveRecord::Base
    has_many :article_categories
    has_many :categories, through: :article_categories
    has_many :flowers
    belongs_to :user
    validates :title, presence: true, length: { minimum: 3, maximum: 10 }
    validates :description, presence: true, length: { minimum: 3, maximum: 20 }
end
