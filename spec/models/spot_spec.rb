require 'rails_helper'

RSpec.describe Spot, type: :model do
  let(:spot) { create(:spot) }

  describe "新規投稿" do
    context "新規投稿が正常時" do
      it "新規投稿時内容に問題が無い場合" do
        expect(spot).to be_valid
      end
      it "titleが15文字以下で作成可能" do
        spot.title = "a" * 15
        expect(spot).to be_valid
      end
      it "contentが150文字以下で作成可能" do
        spot.content = "a" * 150
        expect(spot).to be_valid
      end
    end
    context "新規投稿がうまくいかない時" do
      it "titleがなければ無効であること" do
        spot.title = nil
        expect(spot).not_to be_valid
      end
      it "spot_imageがなければ無効であること" do
        spot.spot_image = nil
        expect(spot).not_to be_valid
      end
      it "addressがなければ無効であること" do
        spot.address = nil
        expect(spot).not_to be_valid
      end
    end
  end
end
