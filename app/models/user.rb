class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :boards, dependent: :destroy
    has_many :tasks, through: :boards
end
