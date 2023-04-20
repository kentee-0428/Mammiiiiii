require "rails_helper"

RSpec.describe "Posts", type: :system do
  let(:user) { create(:user) }
  let(:post) { create(:post) }

  before do
    visit new_user_session_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
  end

  describe "投稿のテスト" do
    context "表示の確認" do
      before do
        visit new_post_path
      end
      it "投稿内容フォームが表示される" do
        expect(page).to have_field "投稿内容"
      end
      it "画像フォームが表示される" do
        expect(page).to have_field "post[post_image]"
      end
      it "投稿ボタンが表示される" do
        expect(page).to have_button "投稿する"
      end
    end
    context "新規投稿" do
      before do
        visit new_post_path
      end
      it "投稿に成功する" do
        fill_in "投稿内容", with: "testです"
        click_button "投稿する"
        expect(page).to have_content "投稿が完了しました。"
      end
      it "投稿に失敗する" do
        fill_in "投稿内容", with: ""
        click_button "投稿する"
        expect(page).to have_content "投稿内容を入力してください"
      end
    end
  end
end
