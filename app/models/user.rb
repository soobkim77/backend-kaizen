class User < ApplicationRecord
    has_secure_password
    validates :username, uniqueness: { case_sensitive: false }
    has_many :boards, as: :owner, dependent: :destroy
    has_many :tasks, through: :boards
    has_many :team_members, as: :member
    has_many :teams, through: :team_members,dependent: :destroy
end
