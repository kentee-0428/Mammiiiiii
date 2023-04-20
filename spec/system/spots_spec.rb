require 'rails_helper'

RSpec.describe "Spots", type: :system do
  let(:user) { create(:user) }
  let(:spot) { create(:spot) }
  let(:category) { create(:category) }

  before do
    visit new_user_session_path
    fill_in "メールアドレス", with: user.email
    fill_in "パスワード", with: user.password
    click_button "ログインする"
  end

  describe "spot新規投稿のテスト" do
    context "表示の確認" do
      before do
        visit new_spot_path
      end
      it "タイトルフォームが表示される" do
        expect(page).to have_field "タイトル"
      end
      it "住所フォームが表示される" do
        expect(page).to have_field "住所"
      end
      it "感想フォームが表示される" do
        expect(page).to have_field "感想"
      end
      it "画像フォームが表示される" do
        expect(page).to have_field "画像"
      end
      it "投稿ボタンが表示される" do
        expect(page).to have_button "投稿する"
      end
    end
    context "新規投稿" do
      before do
        visit new_spot_path
      end
      it "投稿に成功する" do
        fill_in "タイトル", with: "testです"
        fill_in "住所", with: "testです"
        fill_in "感想", with: "testです"
        attach_file "画像", "app/assets/images/default.png"
        click_button "投稿する"
        expect(page).to have_content "投稿が完了しました。"
      end
      it "投稿に失敗する" do
        fill_in "タイトル", with: ""
        fill_in "住所", with: ""
        attach_file "画像", nil
        click_button "投稿する"
        expect(page).to have_content "タイトルを入力してください"
        expect(page).to have_content "住所を入力してください"
        expect(page).to have_content "画像を入力してください"
      end
    end
  end
end
