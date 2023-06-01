require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe 'いいね機能' do
    context 'いいねできるとき' do
      it 'postとuserが紐づいていれば「いいね」することができる' do
        expect(@like).to be_valid
      end
      it 'postの投稿userと同一userでもいいねすることができる' do
        @like.user_id == @like.post.user_id
        expect(@like).to be_valid
      end
    end

    context 'いいねできないとき' do
      it 'postが紐づいていなければ「いいね」できない' do
        @like.post = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('Post must exist')
      end
      it 'userが紐づいていなければ「いいね」できない' do
        @like.user = nil
        @like.valid?
        expect(@like.errors.full_messages).to include('User must exist')
      end
    end
  end
end
