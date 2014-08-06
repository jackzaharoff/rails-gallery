class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_filter :verify_admin
  def index
  end
  protected
    def verify_admin
      unless current_user.has_role?(:admin)
        flash[:alert] = 'Not authorized.'
        redirect_to root_path
      end
    end
end
