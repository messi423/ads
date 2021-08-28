class User < ApplicationRecord
    has_secure_password
    
    has_many :ads
    has_many :comments
end
