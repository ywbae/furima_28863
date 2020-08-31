require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '登録できる' do
      it '正しい入力がされれば登録できる' do
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '登録できない' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailに@がないと登録できない' do
        @user.email = 'abbabb.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが６文字未満では登録できない' do
        @user.password = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'first_nameは漢字/ひらがな/カタカナでないと登録できない' do
        @user.first_name = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角で入力してください。')
      end
      it 'last_nameは漢字/ひらがな/カタカナでないと登録できない' do
        @user.last_name = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角で入力してください。')
      end
      it 'first_name_kanaは全角（カタカナ）でないと登録できない' do
        @user.first_name_kana = 'かりのなまえ'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana は全角カタカナで入力して下さい。')
      end
      it 'last_name_kanaは全角（カタカナ）でないと登録できない' do
        @user.last_name_kana = 'かりのなまえ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana は全角カタカナで入力して下さい。')
      end
    end
  end
end
