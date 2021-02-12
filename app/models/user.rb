class User < ActiveRecord::Base
    has_many :posts
    has_many :comments
    has_many :favoriteposts
    has_many :favorites, through: :favorite_recipes, source: :post
    has_secure_password
    validates :username, presence: true, uniqueness: true, length: {in: 6..25}
    validates :email, presence: true, uniqueness: true, confirmation: true, format: {with:/\A([^@\s]+)@(([-a-z0-9]+)\.([a-z]{2,}))\z/i, message: "please enter a valid email address"}
    validates :password, length: {in: 8..100}, confirmation: true
end
