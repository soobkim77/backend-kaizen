class Team < ApplicationRecord
  belongs_to :leader, :class_name => "User"
  has_many :boards, as: :owner, dependent: :destroy
  has_many :team_members, dependent: :destroy
  has_many :members, through: :team_members, :class_name => "User"

  def all_teams
    tema = TeamMember.where(member_id: @@user.id)
    @team = []
    tema.each do |tm| 
      @team << tm.team
    end

    @team
  end
end
