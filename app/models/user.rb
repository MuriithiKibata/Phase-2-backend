class User < ApplicationRecord
    has_secure_password
    has_many :stores
    validates :password, presence: true, length: {minimum: 6}
    validates :password_confirmation, presence: true, length: {minimum: 6}
    validates :email, presence: true, uniqueness: true


end
