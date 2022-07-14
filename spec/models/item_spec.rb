require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe "商品出品" do
    context "出品できる場合" do
      it "item_name、price、information、category_id、delivery_fee_id、area_id、shipping_date_id、product_condition_id、user_id、imageがある場合は出品できる" do
        expect(@item).to be_valid
      end
      it "priceが半角数字が含まれている場合は出品できる" do
        expect(@item).to be_valid
      end
      it "priceが¥300以上¥9999999未満である場合は出品できる" do
        expect(@item).to be_valid
      end
    end

    context "出品できない場合" do
      it "item_nameがない場合は出品できない" do
        @item.item_name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item name can't be blank")
      end
      it "priceがない場合は出品できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid")
      end
      it "priceに半角数字以外が含まれている場合は出品できない" do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      it "priceが¥300より少ない場合は出品できない" do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "priceが¥99999999より多い場合は出品できない" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "informationがない場合は出品できない" do
        @item.information = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end
      it "category_idがない場合は出品できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "delivery_fee_idがない場合は出品できない" do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it "area_idがない場合は出品できない" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "shipping_date_idがない場合は出品できない" do
        @item.shipping_date_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping date can't be blank")
      end
      it "product_condition_idがない場合は出品できない" do
        @item.product_condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product condition can't be blank")
      end
      it "imageが空では出品出来ない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it "userが紐付いていなければ出品できない" do
        @item.user_id = "aaaaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
