class Admin < ApplicationRecord
    has_many :posts
    has_many :enquiries
    has_secure_password
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
end
