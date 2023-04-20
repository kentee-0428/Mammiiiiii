require "rails_helper"

RSpec.describe User, type: :model do
  let(:user) { create(:user) }

  describe "ユーザー新規登録" do
    context "新規登録が正常時" do
      it "記入内容に問題が無い場合" do
        expect(user).to be_valid
      end
      it "ユーザー名が10文字以下で作成可能" do
        user.name = "a" * 10
        expect(user).to be_valid
      end
      it "ユーザー紹介文が150文字以下で作成可能" do
        user.introduction = "a" * 150
        expect(user).to be_valid
      end
    end
    context "新規登録がうまくいかないとき" do
      it "nameが空だと登録できない" do
        user.name = nil
        expect(user).not_to be_valid
      end
      it "emailが空では登録できない" do
        user.email = nil
        expect(user).not_to be_valid
      end
      it "重複したemailが存在する場合登録できない" do
        user.save
        another_user = build(:user)
        another_user.email = user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("メールアドレスはすでに存在します")
      end
      it "passwordが空では登録できない" do
        user.password = nil
        expect(user).not_to be_valid
      end
      it "passwordが全角であれば登録できない" do
        user.password = "ああああああ"
        user.valid?
        expect(user.errors.full_messages).to include("パスワード(確認用)とパスワードの入力が一致しません")
      end
    end
  end

  describe "パスワードの検証" do
    it "パスワードと確認用パスワードが間違っている場合、無効であること" do
      user.password = "password"
      user.password_confirmation = "passwor"
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end
    it "パスワードが暗号化されていること" do
      expect(user.encrypted_password).to_not eq "password"
    end
  end
end
