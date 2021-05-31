class TeamsController < ApplicationController
    def index
        @teams = Team.find_by(leader_id: @@user.id)
        render json: {teams: TeamSerializer.new(@teams)}, status: :ok
    end

    def show
        @team = Team.find_by(id: params[:id])
        render json: {team: TeamSerializer.new(@team)}, status: :ok
    end

    # def create
    #     @board = Board.create(team_params)
    #     if @board.valid?
    #         render json: {board: @board}, status: :ok
    #     else
    #         render json: {msg: "Failed Create"}, status: :not_acceptable
    #     end
    # end

    private

    def team_params
        params.require(:team).permit(:name, :description)
    end

end
