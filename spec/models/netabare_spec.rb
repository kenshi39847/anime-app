require 'rails_helper'

RSpec.describe Netabare, type: :model do
  before do
    @netabare = FactoryBot.build(:netabare)
  end

  describe 'ネタバレカウント' do
    context 'ネタバレカウントを更新できる場合' do
      it "userとanimeが紐づいていれば更新できる" do
        expect(@netabare).to be_valid
      end
    end
    context 'ネタバレカウントを更新できない場合' do
      it "userが紐付いていなければ投稿できない" do
        @netabare.user = nil
        @netabare.valid?
        expect(@netabare.errors.full_messages).to include('User must exist')
      end
      it "animeが紐付いていなければ投稿できない" do
        @netabare.anime = nil
        @netabare.valid?
        expect(@netabare.errors.full_messages).to include('Anime must exist')
      end
    end
  end
end

