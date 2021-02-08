class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    has_many :favoriteposts
    has_many :favorited_by, through: :favorite_recipes, source: :user
    validates :title, :description, presence: true 
end
