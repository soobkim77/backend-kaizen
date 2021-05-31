class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :boards, as: :owner, dependent: :destroy
    has_many :tasks, through: :boards
    has_many :teams, dependent: :destroy
end
