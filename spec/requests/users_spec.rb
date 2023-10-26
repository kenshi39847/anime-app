require 'rails_helper'

RSpec.describe "Users", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @anime = FactoryBot.create(:anime, user: @user)
  end
  describe "GET /users" do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get user_path(@user)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメのタイトルが存在する' do 
      get user_path(@user)
      expect(response.body).to include(@anime.title)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメの画像が存在する' do 
      get user_path(@user)
      expect(response.body).to include('test_image.png')
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメのジャンルが存在する' do 
      get user_path(@user)
      expect(response.body).to include(@anime.genre.name)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメの良いところが存在する' do 
      get user_path(@user)
      expect(response.body).to include(@anime.good_point.name)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメのどんな人におすすめかが存在する' do 
      get user_path(@user)
      expect(response.body).to include(@anime.recommendation.name)
    end
  end
end
