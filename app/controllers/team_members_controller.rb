class TeamMembersController < ApplicationController


    def create
        @TeamMember = TeamMember.create(mem_params)
        @team = Team.find(params[:team_members][:team_id])
        render json: {team: TeamSerializer.new(@team)}, status: :ok
    end

    def deleter
        @TeamMember = TeamMember.find_by(team_id: params[:team_id], member_id: params[:member_id])
        @team = @TeamMember.team
        @TeamMember.destroy
        render json: {team: TeamSerializer.new(@team)}, status: :ok
    end

    private

    def mem_params
        params.require(:team_members).permit!
    end
end
