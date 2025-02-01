class ApplicationController < ActionController::Base
  before_action :authenticate_employee!
  include CanCan::ControllerAdditions

  helper_method :current_employee

  def current_ability
    @current_ability ||= Ability.new(current_employee)
  end

  def current_employee
    super
  end
end
