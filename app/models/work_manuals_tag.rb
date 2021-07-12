class WorkManualsTag

  include ActiveModel::Model
  attr_accessor :title, :process, :video, :name, :user_id

  with_options presence: true do
    validates :title
    validates :process
    validates :name
    validates :user_id
  end

  def save
    work_manual = WorkManual.create(title: title, process: process, video: video, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    
    WorkManualTagRelation.create(work_manual_id: work_manual.id, tag_id: tag.id)
  end

end