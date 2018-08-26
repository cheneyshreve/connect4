require 'rails_helper'

RSpec.describe BoardsController, type: :controller do
  let(:game) { Board.new }

  describe "#new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "#update" do
    before do
      game.turn_count = 43
    end
    it "recognizes a draw" do
      get :draw
      response.should render_template(:draw)
    end
  end


end
