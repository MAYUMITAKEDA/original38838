require 'rails_helper'

RSpec.describe PostForm, type: :model do
  describe '新規投稿機能' do
    before do
      user = FactoryBot.create(:user)
      tag = FactoryBot.create(:tag)
      image1 = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test1.png'), 'image/png')
      image2 = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test2.png'), 'image/png')
      image3 = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test3.png'), 'image/png')
      image4 = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test4.png'), 'image/png')
      image5 = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test5.png'), 'image/png')
      @post_form = FactoryBot.build(:post_form, user_id: user.id, tag_name: tag.tag_name, images: [image1, image2, image3, image4, image5])
    end

    context '新規投稿ができるとき' do
      it 'すべての値が正しく入力されているとき' do
        expect(@post_form).to be_valid
      end
      it 'タグの入力が空でも投稿できる' do
        @post_form.tag_name = ''
        expect(@post_form).to be_valid
      end
    end

    context '新規投稿ができないとき' do
      it 'titleが空では投稿できない' do
        @post_form.title = ''
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("Title can't be blank")
      end
      it 'titleが51文字以上では投稿できない' do
        @post_form.title = Faker::Lorem.characters(number: 51)
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("Title is too long (maximum is 50 characters)")
      end
      it 'textが空では投稿できない' do
        @post_form.text = ''
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("Text can't be blank")
      end
      it 'textが2001以上では投稿できない' do
        @post_form.text = Faker::Lorem.characters(number: 2001)
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("Text is too long (maximum is 2000 characters)")
      end
      it 'addressが空では投稿できない' do
        @post_form.address = ''
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'addressが201字以上では投稿できない' do
        @post_form.address = Faker::Lorem.characters(number: 201)
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("Address is too long (maximum is 200 characters)") 
      end
      it 'imagesが添付されていない場合、投稿できない' do
        @post_form.images = nil
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("Images can't be blank")
      end
      it 'imagesが6枚以上では投稿できない' do
        images = Array.new(6) do
          Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/test.png'), 'image/png')
        end
        @post_form.images = images
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("Images must be one or no more than five")
      end
      it 'category_idが空では投稿できない' do
        @post_form.category_id = ''
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("Category can't be blank")
      end
      it 'budgetが空では投稿できない' do
        @post_form.budget= ''
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("Budget can't be blank")
      end
      it 'opening_hour_idが空では投稿できない' do
        @post_form.opening_hour_id = ''
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("Opening hour can't be blank")
      end
      it 'area_idが空では投稿できない' do
        @post_form.area_id = ''
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("Area can't be blank")
      end
      it 'userが紐づいていなければ投稿できない' do
        @post_form.user_id = nil
        @post_form.valid?
        expect(@post_form.errors.full_messages).to include("User must exist")
      end
    end
  end
end
