require 'rails_helper'

RSpec.describe WorkManualsTag, type: :model do
  before do
    user = FactoryBot.create(:user)
    @work_manuals_tag = FactoryBot.build(:work_manuals_tag, user_id: user.id)
    sleep 0.1
  end

  describe 'マニュアルの保存' do
    context 'マニュアルが保存できる場合' do
      it '必要な項目が全てあれば保存できる' do
        @work_manuals_tag.valid?
        expect(@work_manuals_tag).to be_valid
      end
      it 'videoがなくても保存できる' do
        @work_manuals_tag.video = nil
        @work_manuals_tag.valid?
        expect(@work_manuals_tag).to be_valid
      end
    end

    context 'マニュアルが保存できない場合' do
      it 'titleが空では保存できない' do
        @work_manuals_tag.title = ''
        @work_manuals_tag.valid?
        expect(@work_manuals_tag.errors.full_messages).to include "Title can't be blank"
      end     
      it 'processが空では保存できない' do
        @work_manuals_tag.process = ''
        @work_manuals_tag.valid?
        expect(@work_manuals_tag.errors.full_messages).to include "Process can't be blank"
      end
      it 'ユーザーが紐付いていなければ保存できない' do
        @work_manuals_tag.user_id = nil
        @work_manuals_tag.valid?
        expect(@work_manuals_tag.errors.full_messages).to include "User can't be blank"
      end
      it 'tagがないと保存できない' do
        @work_manuals_tag.name = ''
        @work_manuals_tag.valid?
        expect(@work_manuals_tag.errors.full_messages).to include "Name can't be blank"
      end
    end
  end
end

