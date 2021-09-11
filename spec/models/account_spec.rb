require 'rails_helper'

RSpec.describe Account, type: :model do
  before do
    @account = FactoryBot.build(:account)
  end

  describe 'ユーザー作成' do
    context '内容に問題ない場合' do
      it '全て正常' do
        expect(@account).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'nickname:必須' do
        @account.nickname = ''
        @account.valid?
        expect(@account.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'account_id:必須' do
        @account.account_id = ''
        @account.valid?
        expect(@account.errors.full_messages).to include("Account can't be blank")
      end
      it 'account_id:6文字以上' do
        @account.account_id = 'aA1'
        @account.valid?
        expect(@account.errors.full_messages).to include("Account is too short (minimum is 6 characters)")
      end
      it 'account_id:半角英数' do
        @account.account_id = 'ＡＡＡＡＡ１１'
        @account.valid?
        expect(@account.errors.full_messages).to include("Account is invalid")
      end
      it 'account_id:一意性' do
        first_user = FactoryBot.create(:account, account_id: 'testtest')
        second_user = FactoryBot.build(:account, account_id: 'testtest')
        second_user.valid?
        expect(second_user.errors.full_messages).to include("Account has already been taken")
      end
      it 'birthday:必須' do
        @account.birthday = ''
        @account.valid?
        expect(@account.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
