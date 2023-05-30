require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメント投稿' do
    context 'コメント投稿できるとき' do
      it '値が正しく入力されているとき' do
        expect(@comment).to be_valid
      end
    end

    context 'コメント投稿できないとき' do
      it 'textが空では投稿できない' do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it 'postが紐づいていなければ投稿できない' do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Post must exist")
      end
      it 'userが紐づいていなければ投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("User must exist")       
      end
    end
  end
end
