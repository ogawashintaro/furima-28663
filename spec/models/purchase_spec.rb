require 'rails_helper'

RSpec.describe Purchase, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase)
  end

  describe '購入者情報の保存' do
    context "保存できる場合" do
      it "postal_code、area_id、municipalities、address、tel、item_id、user_idがある場合は保存できる" do
        expect(@purchase).to be_valid
      end
      it "postal_codeに(-)が含まれている場合は保存できる" do
        expect(@purchase).to be_valid
      end
      it "telが11桁以内である場合は保存できる" do
        expect(@purchase).to be_valid
      end
    end

    context "保存できない場合" do
      it "postal_codeが存在しない場合は保存できない" do
        @purchase.postal_code = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it "area_idが存在しない場合は保存できない" do
        @purchase.area_id = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Area can't be blank")
      end
      it "municipalitiesが存在しない場合は保存できない" do
        @purchase.municipalities = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Municipalities can't be blank")
      end
      it "addressが存在しない場合は保存できない" do
        @purchase.address = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it "telが存在しない場合は保存できない" do
        @purchase.tel = ""
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tel can't be blank")
      end
      it "item_idが紐付いていない場合は保存できない" do
        @purchase.item_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Item can't be blank")
      end
      it "user_idが紐付いていない場合は保存できない" do
        @purchase.user_id = nil
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end
      it "postal_codeに(-)が含まれていない場合は保存できない" do
        @purchase.postal_code = "1234567"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it "telが11桁以上の場合は保存できない" do
        @purchase.tel = "01012344567789"
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Tel It is invalid. No hyphen required")
      end
    end
  end
end
