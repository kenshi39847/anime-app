require 'rails_helper'

RSpec.describe "Comments", type: :request do
  before do
    @user = FactoryBot.create(:user)
    @anime = FactoryBot.create(:anime)
  end
  describe 'POST #create' do
    it 'createアクションにリクエストすると正常にリダイレクトする' do 
      sign_in @user
      comment = FactoryBot.create(:comment, user: @user, anime: @anime)
      post anime_comments_path(comment.anime.id), params: { comment: comment.attributes }
      expect(response.status).to eq 302
    end
  end
end
