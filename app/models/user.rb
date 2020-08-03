class User < ApplicationRecord
    has_secure_password
    
    validates :first_name, :email, :last_name, presence: true
    validates :email, uniqueness: true

end
