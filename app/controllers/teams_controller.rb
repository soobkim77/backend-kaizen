class TeamsController < ApplicationController
    before_action :find_team, only: [ :destroy]

    def index
        @members = Team.all.filter {|team| team.members.ids.include? (@@user.id)}
        @teams = Team.where(leader_id: @@user.id)
        render json: {teams: TeamSerializer.new(@teams), mem: TeamSerializer.new(@members)}, status: :ok
    end

    def show
        @team = Team.find_by(id: params[:id])
        render json: {team: TeamSerializer.new(@team)}, status: :ok
    end

    def create
        @team = Team.new(team_params)
        @team.leader_id = @@user.id
        if @team.valid?
            @team.save
            render json: {team: TeamSerializer.new(@team)}, status: :ok
        else
            render json: {msg: "Failed Create"}, status: :not_acceptable
        end
    end

    def destroy
        id = @team.id
        if @team.destroy
            render json: {message: "Team successfully deleted.", id: id}, status: :ok
        else 
            render json: {message: "You fucked up.", errors: @team.errors}, status: :not_acceptable
        end
    end 

    private

    def team_params
        params.require(:team).permit(:name, :description)
    end

    def find_team
        @team = Team.find_by(id: params[:id])
    end

end
