require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }

  describe "新規投稿" do
    context "新規投稿が正常時" do
      it "新規投稿時内容に問題が無い場合" do
        expect(post).to be_valid
      end
    end

    context "新規投稿がうまくいかない時" do
      it "contentがnilで無効になること" do
        post.content = nil
        expect(post).not_to be_valid
      end
    end
  end
end
