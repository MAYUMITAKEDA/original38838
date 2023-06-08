require 'rails_helper'

RSpec.describe Relationship, type: :model do
  before do
    user1 = FactoryBot.create(:user)
    user2 = FactoryBot.create(:user)
    @relationship = FactoryBot.build(:relationship, following: user1, follower: user2)
  end

  describe 'ユーザーフォロー機能' do
    context 'フォローできるとき' do
      it 'フォロー申請する側の値(following_id)とフォローされる側の値（followed_id）が存在するとき' do
        expect(@relationship).to be_valid
      end
    end

    context 'フォローできないとき' do
      it 'フォロー申請する側の値（following_id）がなければフォローできない' do
        @relationship.following_id = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include('Following must exist')
      end
      it 'フォローされる側の値（followed_is）がなければフォローできない' do
        @relationship.follower_id = nil
        @relationship.valid?
        expect(@relationship.errors.full_messages).to include('Follower must exist')
      end
    end
  end
end
