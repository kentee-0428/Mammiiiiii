require "rails_helper"

RSpec.describe "Users", type: :system do
  let(:user) { create(:user) }

  describe "ユーザー認証のテスト" do
    describe "ユーザー新規登録" do
      before do
        visit new_user_registration_path
      end
      context "新規登録画面に遷移" do
        it "新規登録に成功する" do
          fill_in "ユーザー名", with: "テスト"
          fill_in "メールアドレス", with: "testjiro@example.com"
          fill_in "パスワード", with: "testjiro"
          fill_in "パスワード(確認用)", with: "testjiro"
          click_button "登録する"
          expect(page).to have_content "アカウント登録を受け付けました。"
        end
        it "新規登録に失敗する" do
          fill_in "ユーザー名", with: ""
          fill_in "メールアドレス", with: ""
          fill_in "パスワード", with: ""
          fill_in "パスワード(確認用)", with: ""
          click_button "登録する"
          expect(page).to have_content "メールアドレスを入力してください"
          expect(page).to have_content "ユーザー名を入力してください"
          expect(page).to have_content "パスワードを入力してください"
        end
      end
    end

    describe "ユーザーログイン" do
      before do
        visit new_user_session_path
      end
      context "ログイン画面に遷移" do
        it "ログインに成功する" do
          fill_in "メールアドレス", with: user.email
          fill_in "パスワード", with: user.password
          click_button "ログインする"
          expect(page).to have_content "ログインしました。"
        end
        it "ログインに失敗する" do
          fill_in "メールアドレス", with: ""
          fill_in "パスワード", with: ""
          click_button "ログイン"
          expect(current_path).to eq new_user_session_path
        end
      end
    end
  end

  describe "ユーザーのテスト" do
    before do
      visit new_user_session_path
      fill_in "メールアドレス", with: user.email
      fill_in "パスワード", with: user.password
      click_button "ログインする"
    end
    describe "マイページのテスト" do
      it "ヘッダーにユーザー名が表示される" do
        expect(page).to have_content(user.name)
      end
      it "マイページに遷移し編集リンクが表示される" do
        visit profile_user_path(user)
        expect(page).to have_content "プロフィール編集"
        expect(page).to have_content "アカウント編集"
      end
    end

    describe "プロフィール編集のテスト" do
      context "編集画面へ遷移" do
        it "遷移ができる" do
          visit edit_user_path(user)
          expect(current_path).to eq edit_user_path(user)
        end
      end
      context "表示の確認と編集" do
        before do
          visit edit_user_path(user)
        end
        it "プロフィール編集と表示される" do
          expect(page).to have_content "プロフィール編集"
        end
        it "ユーザー名編集フォームに自分自身のユーザー名が表示される" do
          expect(page).to have_field "ユーザー名", with: user.name
        end
        it "画像編集フォームが表示される" do
          expect(page).to have_field "user[image]"
        end
        it "性別編集フォームが表示される" do
          expect(page).to have_checked_field user.gender
        end
        it "自己紹介文編集フォームに自分の自己紹介文が表示される" do
          expect(page).to have_field "紹介", with: user.introduction
        end
        it "編集に成功する" do
          fill_in "ユーザー名", with: "テスト２"
          click_button "更新する"
          expect(page).to have_content "情報を更新しました"
          expect(page).to have_content "テスト２"
          expect(current_path).to eq profile_user_path(user)
        end
        it "編集に失敗する" do
          fill_in "ユーザー名", with: ""
          click_button "更新する"
          expect(page).to have_content "ユーザー名を入力してください"
          expect(current_path).to eq user_path(user)
        end
      end
    end

    describe "アカウント編集のテスト" do
      context "編集画面へ遷移" do
        it "遷移ができる" do
          visit edit_user_registration_path(user)
          expect(current_path).to eq edit_user_registration_path(user)
        end
      end
      context "表示の確認と編集" do
        before do
          visit edit_user_registration_path(user)
        end
        it "アカウント編集と表示される" do
          expect(page).to have_content "アカウント編集"
        end
        it "メールアドレス編集フォームに自分のメールアドレスが表示される" do
          expect(page).to have_field "メールアドレス", with: user.email
        end
        it "パスワード編集フォームが表示される" do
          expect(page).to have_content "パスワード"
        end
        it "パスワード(確認用)編集フォームが表示される" do
          expect(page).to have_content "パスワード(確認用)"
        end
        it "現在のパスワード編集フォームが表示される" do
          expect(page).to have_content "現在のパスワード"
        end
        it "編集に成功する" do
          fill_in "メールアドレス", with: "test1@gmail.com"
          fill_in "パスワード", with: "123456789"
          fill_in "パスワード(確認用)", with: "123456789"
          fill_in "現在のパスワード", with: user.password
          click_button "更新する"
          expect(page).to have_content "アカウントを更新しました。"
          expect(current_path).to eq root_path
        end
        it "編集に失敗する" do
          fill_in "メールアドレス", with: ""
          fill_in "パスワード", with: ""
          fill_in "パスワード(確認用)", with: ""
          fill_in "現在のパスワード", with: ""
          click_button "更新する"
          expect(page).to have_content "メールアドレスを入力してください"
          expect(page).to have_content "現在のパスワードを入力してください"
          expect(current_path).to eq users_path
        end
      end
    end
  end
end
