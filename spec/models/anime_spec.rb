require 'rails_helper'

RSpec.describe Anime, type: :model do
  before do
    @anime = FactoryBot.build(:anime)
  end

  describe 'アニメの保存' do
    context 'アニメが投稿できる場合' do
      it "title、image、synopsis、genre_id、good_point_id、recommendation_id、textが存在すれば登録できる" do
        expect(@anime).to be_valid
      end

    end
    context 'アニメが投稿できない場合' do
      it 'titleが空では投稿できない' do
        @anime.title = ''
        @anime.valid?
        expect(@anime.errors.full_messages).to include("Title can't be blank")
      end
      it 'imageが空では投稿できない' do
        @anime.image = nil
        @anime.valid?
        expect(@anime.errors.full_messages).to include("Image can't be blank")
      end
      it 'synopsisが空では投稿できない' do
        @anime.synopsis = ''
        @anime.valid?
        expect(@anime.errors.full_messages).to include("Synopsis can't be blank")
      end
      it 'genre_idが空では投稿できない' do
        @anime.genre_id = 0
        @anime.valid?
        expect(@anime.errors.full_messages).to include("Genre can't be blank")
      end
      it 'good_point_idが空では投稿できない' do
        @anime.good_point_id = 0
        @anime.valid?
        expect(@anime.errors.full_messages).to include("Good point can't be blank")
      end
      it 'recommendation_idが空では投稿できない' do
        @anime.recommendation_id = 0
        @anime.valid?
        expect(@anime.errors.full_messages).to include("Recommendation can't be blank")
      end
      it 'textが空では投稿できない' do
        @anime.text = ''
        @anime.valid?
        expect(@anime.errors.full_messages).to include("Text can't be blank")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @anime.user = nil
        @anime.valid?
        expect(@anime.errors.full_messages).to include('User must exist')
      end
    end
  end
end
