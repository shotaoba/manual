require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '登録できるとき' do
      it '必要な項目が全て入力されていれば登録できる' do
        @user.valid?
        expect(@user).to be_valid
      end
      it 'authority_idが1以外であれば登録できる' do
        @user.authority_id = 3
        @user.valid?
        expect(@user).to be_valid
      end
    end

    context '登録できないとき' do
      it 'nameが空では登録できない' do
        @user.name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'authority_idが空では登録できない' do
        @user.authority_id = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Authority can't be blank")
      end
      it 'authority_idが1では登録できない' do
        @user.authority_id = 1
        @user.valid?
        expect(@user.errors.full_messages).to include("Authority must be other than 1")
      end
    end
  end
end