require 'rails_helper'

RSpec.describe Board, type: :model do
  let(:board) { Board.new }

  describe "#board" do
    it "defines the gameboard as an array with 6-rows" do
     expect(board.row1).to be_a(Array)
     expect(board.row2).to be_a(Array)
     expect(board.row3).to be_a(Array)
     expect(board.row4).to be_a(Array)
     expect(board.row5).to be_a(Array)
     expect(board.row6).to be_a(Array)
    end
    it "defines each row with 7-columns" do
     expect(board.row1.length).to eq(7)
     expect(board.row2.length).to eq(7)
     expect(board.row3.length).to eq(7)
     expect(board.row4.length).to eq(7)
     expect(board.row5.length).to eq(7)
     expect(board.row6.length).to eq(7)
    end
  end

  describe "#win?" do

    before do
      board.row1 = ["", "", "", "", "", "", ""]
      board.row2 = ["", "", "", "", "", "", ""]
      board.row3 = ["", "", "", "", "", "", ""]
      board.row4 = ["", "", "", "", "", "", ""]
      board.row5 = ["", "", "", "", "", "", ""]
      board.row6 = ["X", "X", "X", "X", "", "", ""]
    end
    it "identifies a horizontal win" do
     expect(board.win?).to be_truthy
    end
    before do
      board.row1 = ["", "X", "", "", "", "", ""]
      board.row2 = ["", "X", "", "", "", "", ""]
      board.row3 = ["", "X", "", "", "", "", ""]
      board.row4 = ["", "X", "", "", "", "", ""]
      board.row5 = ["", "", "", "", "", "", ""]
      board.row6 = ["", "", "", "", "", "", ""]
    end
    it "identifies a vertical win" do
      expect(board.win?).to be_truthy
    end
    before do
      board.row1 = ["", "", "", "", "", "", ""]
      board.row2 = ["", "", "", "", "", "", ""]
      board.row3 = ["", "", "", "", "", "", "O"]
      board.row4 = ["", "", "", "", "", "O", ""]
      board.row5 = ["", "", "", "", "O", "", ""]
      board.row6 = ["", "", "", "O", "", "", ""]
    end
    it "identifies a right-diagonal win" do
     expect(board.win?).to be_truthy
    end
    before do
      board.row1 = ["", "", "", "", "", "", ""]
      board.row2 = ["", "", "", "", "", "", ""]
      board.row3 = ["O", "", "", "", "", "", ""]
      board.row4 = ["", "O", "", "", "", "", ""]
      board.row5 = ["", "", "O", "", "", "", ""]
      board.row6 = ["", "", "", "O", "", "", ""]
    end
    it "identifies a left-diagonal win" do
     expect(board.win?).to be_truthy
    end
    before do
      board.row1 = ["", "", "", "", "", "", ""]
      board.row2 = ["", "", "", "", "", "", ""]
      board.row3 = ["O", "", "", "", "X", "", ""]
      board.row4 = ["", "", "", "", "", "", ""]
      board.row5 = ["", "", "O", "", "", "", ""]
      board.row6 = ["", "", "", "O", "", "", ""]
    end
    it "returns space for an unfilled board" do
     expect(board.win?).to eql("")
    end

  end

end
