class ProceduresController < ApplicationController
  def create
      @procedure = Procedure.new(procedure_params)
      if @procedure.save
        redirect_to work_manual_path(@procedure.work_manual.id)
      else
        @work_manuals = WorkManual.all
        render "work_manuals/index"
      end
  end

  def destroy
    @work_manual = WorkManual.find(params[:work_manual_id])
    procedure = @work_manual.procedures.find(params[:id])
    procedure.destroy
    redirect_to work_manual_path(@work_manual.id)
  end

  private
  def procedure_params
    params.require(:procedure).permit(:description, :point, :image).merge(user_id: current_user.id, work_manual_id: params[:work_manual_id])
  end
end
