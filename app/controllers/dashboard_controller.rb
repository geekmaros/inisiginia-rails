class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show]
  def show
  end

  private

  def set_user
    @user = current_user
    return unless params[:user_id].present?

    if params[:user_id].to_s == current_user.id.to_s
      @user
    else
      redirect_to user_dashboard_path(current_user)
    end
  end
end
