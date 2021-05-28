class Team < ApplicationRecord
  belongs_to :leader, :class_name => "User"
  has_many :boards, as: :owner, dependent: :destroy
  has_many :team_members
  has_many :members, through: :team_members
end
