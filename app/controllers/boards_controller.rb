class BoardsController < ApplicationController

  # define a new game
  def new
    @game = Board.new
    @board = @game.board
    @player_number = @game.player_number
    @game.save
  end

  # update game based on status. If total_turns > 42 then there's a draw.
  def update
    @game = Board.find(params[:id])
    column = board_params.to_i
    @game.position = @game.place_marker(column)
    @game.save
    @board = @game.board
    @player_number = @game.player_number
    if @game.win?
      Board.delete_all
      render 'win'
    elsif @game.total_turns > 42
      Board.delete_all
      render 'draw'
    else
      @game.turn_count += 1
      @game.save
      @player_number = @game.player_number
      render 'new'
    end
  end

  private
  def board_params
    params.require(:commit)
  end
end
