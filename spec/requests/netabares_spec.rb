require 'rails_helper'

RSpec.describe "Netabares", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @anime = FactoryBot.create(:anime)
    @netabare = FactoryBot.create(:netabare, user: @user, anime: @anime)
  end
  describe 'POST #change_count' do
    it 'change_countアクションにリクエストすると正常にリダイレクトする' do 
      sign_in @user
      post change_count_anime_netabare_path(@netabare.anime, @netabare)
      expect(response.status).to eq 302
    end
  end
end
