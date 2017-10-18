class CreateBoardMailer < ApplicationMailer
  def create_board(board)
    @board = board

    mail to: @board.user.email, subject: "確認メール"
  end
end
