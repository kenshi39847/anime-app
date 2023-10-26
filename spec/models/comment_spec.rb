require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
    @comment.save
    @comment_reply = FactoryBot.build(:comment, parent: @comment)
  end

  describe 'コメント投稿' do
    context 'コメントが投稿できる場合' do
      it 'contentが存在していれば投稿できる' do
        expect(@comment).to be_valid
      end
      it 'parent_idが空でも投稿できる' do
        @comment.parent_id = ''
        expect(@comment).to be_valid
      end
    end
    context 'コメントが投稿できない場合' do
      it 'contentが空では投稿できない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content can't be blank")
      end
      it 'contentが1000文字を超える場合は投稿できない' do
        @comment.content = 'a' * 1001
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Content is too long (maximum is 1000 characters)")
      end
      it 'userが紐付いていないと投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
      it 'animeが紐付いていないと投稿できない' do
        @comment.anime = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Anime must exist')
      end
    end
  end

  describe '返信投稿' do
    context '返信が投稿できる場合' do
      it 'content、parent_idが存在していれば投稿できる' do
        expect(@comment_reply).to be_valid
      end
    end
    context '返信が投稿できない場合' do
      it 'contentが空では投稿できない' do
        @comment_reply.content = ''
        @comment_reply.valid?
        expect(@comment_reply.errors.full_messages).to include("Content can't be blank")
      end
      it 'parent_idが空では投稿できない' do
        @comment_reply.parent_id = ''
        @comment_reply.valid?
        binding.pry
        expect(@comment_reply.errors.full_messages).to include("Parent_id can't be blank")
      end
      it 'userが紐付いていないと投稿できない' do
        @comment_reply.user = nil
        @comment_reply.valid?
        expect(@comment_reply.errors.full_messages).to include('User must exist')
      end
      it 'animeが紐付いていないと投稿できない' do
        @comment_reply.anime = nil
        @comment_reply.valid?
        expect(@comment_reply.errors.full_messages).to include('Anime must exist')
      end
    end
  end
end
