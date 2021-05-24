class BoardsController < ApplicationController
    before_action :find_board, only: [:update, :destroy]


    def index
        @boards = Board.where(user_id: @@user.id)
        render json: {boards: @boards}, status: :ok
    end

    def show
        @board = Board.find_by(id: params[:id])
        @tasks = @board.tasks
        render json: {board: @board, tasks: @tasks}, status: :ok
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

    def update
        if @board.update(board_params)
            render json: @board, status: :ok
        else
            render json: {msg: "Failed Update"}, status: :not_acceptable
        end
    end

    def destroy
        id = @board.id
        if @board.destroy
            render json: {message: "Blog successfully deleted.", id: id}, status: :ok
        else 
            render json: {message: "You fucked up.", errors: @board.errors}, status: :not_acceptable
        end
    end

    private

    def find_board
        @board = Board.find_by(id: params[:id])
    end

    def board_params
        params.require(:board).permit(:title, :description, :id)
    end
end
