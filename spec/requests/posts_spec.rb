require 'rails_helper'
RSpec.describe PostsController, type: :request do
  describe 'GET #search' do
    before do
      @post = FactoryBot.create(:post)
    end

    context '検索機能' do
      it '検索フォームの「タイトル」へ値を入力すると、レスポンスにタイトルと部分一致する投稿済テキストが返される' do
        get search_posts_path, params: { q: { title_cont: 'Title' } }
        expect(response).to be_successful
        expect(response.body).to include(@post.title)
      end
      it '検索フォームの「カテゴリ欄」にチェックを入れると、レスポンスにチェックしたカテゴリと一致する投稿済テキストが返される' do
        get search_posts_path, params: { q: { category_id_in: [1] } }
        expect(response).to be_successful
        expect(response.body).to include(@post.category.name)
      end
      it '検索フォームの「予算」へ値を入力すると、レスポンスに予算と一致または値以上の予算を持つ投稿済テキストが返される。' do
        get search_posts_path, params: { q: { budget_gteq: 1000 } }
        expect(response).to be_successful
        expect(response.body).to include(@post.title)
      end
      it '検索フォームの「予算」へ値を入力すると、レスポンスに予算と一致または値以上の予算を持つ投稿済テキストが返される。' do
        get search_posts_path, params: { q: { budget_lteq: 500 } }
        expect(response).to be_successful
        expect(response.body).not_to include(@post.title)
      end
      it '検索フォームの「営業時間欄」にチェックを入れると、レスポンスにチェックした営業時間と一致する投稿済テキストが返される' do
        get search_posts_path, params: { q: { opening_hour_id_in: [1] } }
        expect(response).to be_successful
        expect(response.body).to include(@post.title)
      end
      it '検索フォームの「エリア欄」にチェックを入れると、レスポンスにチェックしたエリアと一致する投稿済テキストが返される' do
        get search_posts_path, params: { q: { area_id_in: [1] } }
        expect(response).to be_successful
        expect(response.body).to include(@post.title)
      end
      it '検索フォームへ入力された値について、一致するデータがなければ何も返さない' do
        get search_posts_path, params: nil
        expect(response).to be_successful
        expect(response.body).to include
      end
      it '検索フォームへ何の値も入力せずに検索ボタンを押すと、全ての投稿済テキストが返される' do
        get search_posts_path, params: { q: {} }
        expect(response).to be_successful
        expect(response.body).to include(@post.title)
      end
    end
  end
end
