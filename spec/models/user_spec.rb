require 'rails_helper'

RSpec.describe User, type: :model do
  before do
       @user = FactoryBot.build(:user)
  end

 describe 'ユーザー新規登録' do
  it 'family_nameが空では登録できない' do
    @user.family_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name can't be blank")
  end
  
  it 'first_nameが空では登録できない' do
    @user.first_name = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end
  
  it 'family_name_kanaが空では登録できない' do
    @user.family_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana can't be blank")
  end
  
  it 'first_name_kanaが空では登録できない' do
    @user.first_name_kana = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana can't be blank")
  end
  
  it 'birthが空では登録できない' do
    @user.birth = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Birth can't be blank")
  end
  
  it '全角文字を含むパスワードでは登録できない' do
    @user.password = 'パスワード１２３４５'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  
  it 'family_nameが全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
    @user.family_name = 'Jackson'
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name is invalid")
  end
  
  it 'first_nameが全角（漢字・ひらがな・カタカナ）での入力でないと登録できない' do
    @user.first_name = 'John'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid")
  end
  
  it 'family_name_kanaが全角（カタカナ）での入力でないと登録できない' do
    @user.family_name_kana = 'まいける'
    @user.valid?
    expect(@user.errors.full_messages).to include("Family name kana is invalid")
  end
  
  it 'first_name_kanaが全角（カタカナ）での入力でないと登録できない' do
    @user.first_name_kana = 'じろう'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid")
  end
  end
 end
end