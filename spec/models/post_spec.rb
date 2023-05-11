require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '新規投稿機能' do
    context '新規投稿ができるとき' do
      it '全ての項目が入力されているとき' do
        expect(@post).to be_valid
      end
    end

    context '新規投稿ができないとき' do
      it 'titleが空では投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end
      it 'titleが51文字以上では投稿できない' do
        @post.title = Faker::Lorem.characters(number: 51)
        @post.valid?
        expect(@post.errors.full_messages).to include("Title is too long (maximum is 50 characters)")
      end
      it 'textが空では投稿できない' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Text can't be blank")
      end
      it 'textが2001以上では投稿できない' do
        @post.text = Faker::Lorem.characters(number: 2001)
        @post.valid?
        expect(@post.errors.full_messages).to include("Text is too long (maximum is 2000 characters)")
      end
      it 'addressが空では投稿できない' do
        @post.address = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Address can't be blank")
      end
      it 'addressが201字以上では投稿できない' do
        @post.address = Faker::Lorem.characters(number: 201)
        @post.valid?
        expect(@post.errors.full_messages).to include("Address is too long (maximum is 200 characters)") 
      end
      it 'imageが添付されていない場合、投稿できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Image can't be blank")
      end
      it 'category_idが空では投稿できない' do
        @post.category_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Category can't be blank")
      end
      it 'category_idに「-----」が選択されている場合は投稿できない' do
        @post.category_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Category can't be blank")
      end
      it 'budget_idが空では投稿できない' do
        @post.budget_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Budget can't be blank")
      end
      it 'budget_idに「-----」が選択されている場合は投稿できない' do
        @post.budget_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Budget can't be blank")
      end
      it 'opening_hour_idが空では投稿できない' do
        @post.opening_hour_id = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Opening hour can't be blank")
      end
      it 'opening_hour_idに「-----」が選択されている場合は投稿できない' do
        @post.opening_hour_id = '1'
        @post.valid?
        expect(@post.errors.full_messages).to include("Opening hour can't be blank")
      end
      it 'userが紐づいていなければ投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end
<<<<<<< Updated upstream
=======


>>>>>>> Stashed changes
