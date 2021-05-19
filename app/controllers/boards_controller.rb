class BoardsController < ApplicationController
    before_action :find_board, only: [:update, :destroy]


    def index
        @boards = Board.find_by(user_id: @@user.id)
    end

    def show
        @board = Board.find_by(id: params[:id])
    end 
    
    def create
        @board = Board.new(board_params)
        @board.user = @@user
        if @board.valid?
            @board.save
            render json: @board, status: :ok
        else
            render json: {message: "You fucked up.", errors: @board.errors}, status: :not_acceptable
        end
    end

    private

    def find_board
        @board = Board.find_by(id: params[:id])
    end

    def board_params
        params.require(:board).permit(:title, :description)
    end
end
