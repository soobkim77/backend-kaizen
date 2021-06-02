class TeamMember < ApplicationRecord
  belongs_to :member, :class_name => "User"
  belongs_to :team
  validates :member_id, uniqueness: {scope: :team_id}
end
