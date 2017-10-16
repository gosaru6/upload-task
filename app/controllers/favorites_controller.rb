class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favorite = current_user.favorites.create(board_id: params[:board_id])
    redirect_to boards_url, notice: "#{favorite.board.user.name}さんのブログをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(board_id: params[:board_id]).destroy
    redirect_to boards_url, notice: "#{favorite.board.user.name}さんのブログをお気に入り解除しました"
  end
end
