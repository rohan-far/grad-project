class ApplicationController < ActionController::Base
  before_action :authenticate_employee!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  include CanCan::ControllerAdditions

  helper_method :current_employee

  def current_ability
    @current_ability ||= Ability.new(current_employee)
  end

  def current_employee
    super
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :yearly_salary, :department_id])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name, :yearly_salary, :department_id])
  end
end
