class WorkManualsController < ApplicationController
  before_action :set_params, only: [:edit, :update, :show]
  before_action :move_to_index, only: [:new, :edit, :update]


  def index
    @search = WorkManual.ransack(params[:q])
    @work_manuals = @search.result
    @tags = Tag.all
    @approvals = Approval.all
  end
  def new
    @work_manual = WorkManualsTag.new
  end
  def create
    @work_manual = WorkManualsTag.new(work_manual_params)
    if @work_manual.valid?
      @work_manual.save
      redirect_to action: :index
    else
      render :new
    end 
  end
  def edit
  end
  def update
    if @work_manual.update(work_manual_params)
      redirect_to action: :index
    else
      render :edit
    end
  end
  def destroy
    work_manual = WorkManual.find(params[:id])
    work_manual.destroy
    redirect_to action: :index
  end
  def show
    @procedure = Procedure.new
    @procedures = @work_manual.procedures.includes(:user)
  end
  def search
    return nil if params[:keyword] == ""
    tag = Tag.where(['name LIKE ?', "%#{params[:keyword]}%"] )
    render json:{ keyword: tag }
  end

  private

  def work_manual_params
    params.require(:work_manuals_tag).permit(:title, :process, :video, :name).merge(user_id: current_user.id)
  end
  def move_to_index
    unless current_user.authority_id >= 3
      redirect_to action: :index
    end
  end
  def set_params
    @work_manual = WorkManual.find(params[:id])
  end
end
