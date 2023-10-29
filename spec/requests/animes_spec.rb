require 'rails_helper'

RSpec.describe "Animes", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @anime = FactoryBot.create(:anime, user: @user)
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアニメのタイトルが存在する' do 
      get root_path
      expect(response.body).to include(@anime.title)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアニメの画像が存在する' do 
      get root_path
      expect(response.body).to include('test_image.png')
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアニメのジャンルが存在する' do 
      get root_path
      expect(response.body).to include(@anime.genre.name)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアニメの良いところが存在する' do 
      get root_path
      expect(response.body).to include(@anime.good_point.name)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのアニメのどんな人におすすめかが存在する' do 
      get root_path
      expect(response.body).to include(@anime.recommendation.name)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do 
      get root_path
      expect(response.body).to include('検索')
    end
  end

  describe 'GET #new' do
    it 'newアクションにリクエストすると正常にレスポンスが返ってくる' do 
      sign_in @user
      get new_anime_path
      expect(response.status).to eq 200
    end
    it 'newアクションにリクエストするとレスポンスにアニメタイトルフォームが存在する' do 
      sign_in @user
      get new_anime_path
      expect(response.body).to include('アニメタイトル')
    end
    it 'newアクションにリクエストするとレスポンスにアニメ画像フォームが存在する' do 
      sign_in @user
      get new_anime_path
      expect(response.body).to include('画像')
    end
    it 'newアクションにリクエストするとレスポンスにあらすじフォームが存在する' do 
      sign_in @user
      get new_anime_path
      expect(response.body).to include('あらすじ')
    end
    it 'newアクションにリクエストするとレスポンスにジャンルフォームが存在する' do 
      sign_in @user
      get new_anime_path
      expect(response.body).to include('ジャンル')
    end
    it 'newアクションにリクエストするとレスポンスに良いところフォームが存在する' do 
      sign_in @user
      get new_anime_path
      expect(response.body).to include('良いところ')
    end
    it 'newアクションにリクエストするとレスポンスにどんな人におすすめかフォームが存在する' do 
      sign_in @user
      get new_anime_path
      expect(response.body).to include('どんな人におすすめか')
    end
    it 'newアクションにリクエストするとレスポンスにアニメを観た感想フォームが存在する' do 
      sign_in @user
      get new_anime_path
      expect(response.body).to include('アニメを観た感想')
    end
  end

  describe 'POST #create' do
    it 'createアクションにリクエストすると正常にリダイレクトする' do 
      post animes_path, params: { anime: @anime.attributes }
      expect(response.status).to eq 302
    end
  end


  describe 'GET #edit' do
    it 'editアクションにリクエストすると正常にレスポンスが返ってくる' do 
      sign_in @user
      get edit_anime_path(@anime)
      expect(response.status).to eq 200
    end
    it 'editアクションにリクエストするとレスポンスにアニメ画像フォームが存在する' do 
      sign_in @user
      get edit_anime_path(@anime)
      expect(response.body).to include('アニメタイトル')
    end
    it 'editアクションにリクエストするとレスポンスにアニメ画像フォームが存在する' do 
      sign_in @user
      get edit_anime_path(@anime)
      expect(response.body).to include('画像')
    end
    it 'editアクションにリクエストするとレスポンスにあらすじフォームが存在する' do 
      sign_in @user
      get edit_anime_path(@anime)
      expect(response.body).to include('あらすじ')
    end
    it 'editアクションにリクエストするとレスポンスにジャンルフォームが存在する' do 
      sign_in @user
      get edit_anime_path(@anime)
      expect(response.body).to include('ジャンル')
    end
    it 'editアクションにリクエストするとレスポンスに良いところフォームが存在する' do 
      sign_in @user
      get edit_anime_path(@anime)
      expect(response.body).to include('良いところ')
    end
    it 'editアクションにリクエストするとレスポンスにどんな人におすすめかフォームが存在する' do 
      sign_in @user
      get edit_anime_path(@anime)
      expect(response.body).to include('どんな人におすすめか')
    end
    it 'editアクションにリクエストするとレスポンスにアニメを観た感想フォームが存在する' do 
      sign_in @user
      get edit_anime_path(@anime)
      expect(response.body).to include('アニメを観た感想')
    end
  end

  describe 'patch #update' do
    it 'updateアクションにリクエストすると正常にリダイレクトする' do
      sign_in @user
      patch anime_path(@anime), params: { anime: @anime.attributes }
      expect(response.status).to eq 302
    end
  end

  describe 'DELETE #destroy' do
    it 'destroyアクションにリクエストすると正常にリダイレクトする' do 
      sign_in @user
      delete anime_path(@anime)
      expect(response.status).to eq 302
    end
  end

  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get anime_path(@anime)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメのタイトルが存在する' do 
      get anime_path(@anime)
      expect(response.body).to include(@anime.title)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメの画像が存在する' do 
      get anime_path(@anime)
      expect(response.body).to include('test_image.png')
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメのあらすじが存在する' do 
      get anime_path(@anime)
      expect(response.body).to include(@anime.synopsis)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメのジャンルが存在する' do 
      get anime_path(@anime)
      expect(response.body).to include(@anime.genre.name)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメの良いところが存在する' do 
      get anime_path(@anime)
      expect(response.body).to include(@anime.good_point.name)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメのどんな人におすすめかが存在する' do 
      get anime_path(@anime)
      expect(response.body).to include(@anime.recommendation.name)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメのアニメを観た感想が存在する' do 
      get anime_path(@anime)
      expect(response.body).to include(@anime.text)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みのアニメのコメントや質問が存在する' do 
      get anime_path(@anime)
      expect(response.body).to include('コメントや質問')
    end
  end

  describe 'GET #search' do
    it 'searchアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get search_animes_path
      expect(response.status).to eq 200
    end
    it 'searchアクションにリクエストするとレスポンスに投稿済みのアニメのタイトルが存在する' do 
      get search_animes_path
      expect(response.body).to include(@anime.title)
    end
    it 'searchアクションにリクエストするとレスポンスに投稿済みのアニメの画像が存在する' do 
      get search_animes_path
      expect(response.body).to include('test_image.png')
    end
    it 'searchアクションにリクエストするとレスポンスに投稿済みのアニメのジャンルが存在する' do 
      get search_animes_path
      expect(response.body).to include(@anime.genre.name)
    end
    it 'searchアクションにリクエストするとレスポンスに投稿済みのアニメの良いところが存在する' do 
      get search_animes_path
      expect(response.body).to include(@anime.good_point.name)
    end
    it 'searchアクションにリクエストするとレスポンスに投稿済みのアニメのどんな人におすすめかが存在する' do 
      get search_animes_path
      expect(response.body).to include(@anime.recommendation.name)
    end
    it 'searchアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do 
      get search_animes_path
      expect(response.body).to include('検索')
    end
  end
end
