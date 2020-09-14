require 'rails_helper'

RSpec.describe PaymentForm, type: :model do
  describe '商品購入' do
    context '購入できる' do
      it '正しい入力がされれば購入できる' do
        payment_form = FactoryBot.build(:payment_form)
        expect(payment_form).to be_valid
      end
    end

    context '購入できない' do
      it 'トークンがないと、決済できない' do
        payment_form = FactoryBot.build(:payment_form, token: nil)
        payment_form.valid?
        expect(payment_form.errors[:token]).to include('can\'t be blank')
      end

      it '郵便番号が空欄だと購入できない' do
        payment_form = FactoryBot.build(:payment_form, postal_code: "")
        payment_form.valid?
        expect(payment_form.errors[:postal_code]).to include('can\'t be blank')
      end

      it '郵便番号にハイフンがないと購入できない' do
        payment_form = FactoryBot.build(:payment_form, postal_code: '1111111')
        payment_form.valid?
        expect(payment_form.errors[:postal_code]).to include('を入力してください')
      end
      it '都道府県を選択しないと購入できない' do
        payment_form = FactoryBot.build(:payment_form, prefecture_id: nil)
        payment_form.valid?
        expect(payment_form.errors[:prefecture_id]).to include('を選択してください')
      end
      it '市区町村が空欄だと購入できない' do
        payment_form = FactoryBot.build(:payment_form, city: "")
        payment_form.valid?
        expect(payment_form.errors[:city]).to include('can\'t be blank')
      end
      it '番地がないと購入できない' do
        payment_form = FactoryBot.build(:payment_form, addresses: "")
        payment_form.valid?
        expect(payment_form.errors[:addresses]).to include('can\'t be blank')
      end
      it '電話番号が空欄では購入できない' do
        payment_form = FactoryBot.build(:payment_form, phone_number: "")
        payment_form.valid?
        expect(payment_form.errors[:phone_number]).to include('can\'t be blank')
      end
      it '電話番号にハイフンが入ると購入できない' do
        payment_form = FactoryBot.build(:payment_form, phone_number: '070-0070-0070')
        payment_form.valid?
        expect(payment_form.errors[:phone_number]).to include('は11桁以内の数字（ハイフン不要）で入力してください')
      end
      it '電話番号が11桁以上では購入できない' do
        payment_form = FactoryBot.build(:payment_form, phone_number: '0700700070000')
        payment_form.valid?
        expect(payment_form.errors[:phone_number]).to include('は11桁以内の数字（ハイフン不要）で入力してください')
      end
    end
  end
end