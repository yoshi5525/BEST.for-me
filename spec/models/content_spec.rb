require 'rails_helper'

describe Content, type: :model do
  describe '#create' do
    it "productがない場合は投稿できないこと" do
      content = build(:content, product: nil)
      content.valid?
      expect(content.errors[:product]).to include("を入力してください")
    end

    it "bodyがない場合は投稿できないこと" do
      content = build(:content, body: nil)
      content.valid?
      expect(content.errors[:body]).to include("を入力してください")
    end

    it "imageがない場合は投稿できないこと" do
      content = build(:content, image: nil)
      content.valid?
      expect(content.errors[:image]).to include("を入力してください")
    end
  end
end