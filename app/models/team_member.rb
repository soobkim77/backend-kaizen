class TeamMember < ApplicationRecord
  belongs_to :member, :class_name => "User"
  belongs_to :team
end
