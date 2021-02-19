class Post < ActiveRecord::Base
    belongs_to :user
    has_many :comments
    has_many :favoriteposts
    has_many :favorited_by, through: :favoriteposts, source: :user
    validates :title, :description, presence: true 

    def button_text(current_user)
        self.favorited_by.include?(current_user) ? "remove from favorites" : "add to favorites"
    end
end
