class RegistrationsController < Devise::RegistrationsController
  def new
    flash[:info] = 'Registrations are temporarily disabled. Please check back soon.'
    redirect_to root_path
  end

  def create
    flash[:info] = 'Registrations are temporarily disabled. Please check back soon.'
    redirect_to root_path
  end
end