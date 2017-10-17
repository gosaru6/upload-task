class BoardsController < ApplicationController
  before_action :set_board, only: [:show, :edit, :update, :destroy]
  before_action :current_user_check, only: [:new, :edit, :show, :destroy]

  def top
  end

  def index
    @boards = Board.all
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(board_params)
    @board.user_id = current_user.id
    if @board.save
      redirect_to boards_path, notice: "さくせいしました"
    else
      render 'new'
    end
  end

  def show
    @favorite = current_user.favorites.find_by(board_id: @board.id)
  end

  def update
    if @board.update(board_params)
      redirect_to boards_path, notice: "へんしゅうしました"
    else
      render 'edit'
    end
  end

  def destroy
    @board.destroy
    redirect_to boards_path, notice: "けしました"
  end

  def favorite
    @favorites = current_user.favorite_boards
  end

  private
  def board_params
    params.require(:board).permit(:content, :created_at)
  end

  def set_board
    @board = Board.find(params[:id])
  end

  def current_user_check
    current_user
    if !logged_in?
      redirect_to new_session_path, notice: "ログインしてください"
    end
  end

end
