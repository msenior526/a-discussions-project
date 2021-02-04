class User < ActiveRecord::Base
    has_many :posts
    has_many :comments, through: :posts
    has_secure_password
    validates :username, presence: true, uniqueness: true, length: {in: 6..25}
    validates :email, presence: true, uniqueness: true, format: {with:/\A(?<username>[^@\s]+)@((?<domain_name>[-a-z0-9]+)\.(?<domain>[a-z]{2,}))\z/i}
    validates :password, length: {in: 8..100}, confirmation: true
end
