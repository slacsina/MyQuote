class User < ApplicationRecord
    has_secure_password
    has_many :quotes, dependent: :destroy
    validates :fname, :surname, :email, presence: true
end
