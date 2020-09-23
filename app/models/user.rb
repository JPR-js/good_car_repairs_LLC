class User < ApplicationRecord
    has_one :reservation
    validates :email, uniqueness: true
end
