class ApprovalsController < ApplicationController
  before_action :move_to_index, only: [:create, :destroy]

  def create
    approval = Approval.create(user_id: current_user.id, work_manual_id: params[:work_manual_id])
    redirect_to work_manuals_path
  end
  def destroy
    approval = Approval.find(params[:id])
    approval.destroy
    redirect_to work_manuals_path
  end

  private
  
  def move_to_index
    unless current_user.authority_id == 4
      redirect_to action: :index
    end
  end

end
