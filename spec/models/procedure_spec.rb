require 'rails_helper'

RSpec.describe Procedure, type: :model do
  before do
    user = FactoryBot.create(:user)
    work_manuals_tag = FactoryBot.create(:work_manuals_tag, user_id: user.id)
    @procedure = FactoryBot.build(:procedure, user_id: user.id, work_manual_id: work_manuals_tag.id)
  end

  describe '手順の保存' do
    context '内容の問題がない場合' do
      it '必要な項目が全て入力されていれば、登録ができる' do
        @procedure.valid?
        expect(@procedure).to be_valid
      end
      it 'pointが空でも他が全て入力されていれば、登録できる' do
        @procedure.point = ''
        @procedure.valid?
        expect(@procedure).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'descriptionがないと登録ができない' do
        @procedure.description = ''
        @procedure.valid?
        expect(@procedure.errors.full_messages).to include "Description can't be blank"
      end
      it 'imageがnilでは登録できない' do
        @procedure.image = nil
        @procedure.valid?
        expect(@user.errors.full_messages).to include "Image can't be blank"
      end
    end
  end

end
