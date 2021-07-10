class WorkManualsController < ApplicationController
  def index
    @work_manuals = WorkManual.all
  end
  def new
    @work_manual = WorkManual.new
  end
  def create
    @work_manual = WorkManual.new(work_manual_params)
    if @work_manual.save
      redirect_to action: :index
    else
      render :new
    end 
  end
  def edit
    @work_manual = WorkManual.find(params[:id])
  end
  def update
    @work_manual = WorkManual.find(params[:id])
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
    @work_manual = WorkManual.find(params[:id])
    @procedure = Procedure.new
    @procedures = @work_manual.procedures.includes(:user)
  end


  private
  def work_manual_params
    params.require(:work_manual).permit(:title, :process, :video).merge(user_id: current_user.id )
  end
end
