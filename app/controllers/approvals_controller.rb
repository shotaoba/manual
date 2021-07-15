class ApprovalsController < ApplicationController
  def create
    approval = Approval.create(user_id: current_user.id, work_manual_id: params[:work_manual_id])
    redirect_to work_manuals_path
  end
  def destroy
    work_manual = WorkManual.find(params[:work_manual_id])
    approval = work_manual.approval.find(params[:id])
    approval.destroy
    redirect_to work_manuals_path
  end

end
