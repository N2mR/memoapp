class User < ApplicationRecord
    has_secure_password
    has_many :memo
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: {maximum: 225}, format: VALID_EMAIL_REGEX, uniqueness: true
    validates :password, presence: true, length: {minimum: 8, maximum: 50}
end
