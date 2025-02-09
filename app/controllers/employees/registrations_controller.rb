class Employees::RegistrationsController < Devise::RegistrationsController
    before_action :require_no_authentication, except: [:new, :create]

    
    private
    
    def sign_up(resource_name, resource)
    end
  
end
  