class Employees::RegistrationsController < Devise::RegistrationsController
    before_action :require_no_authentication, except: [:new, :create]
  
    def create
      current_admin = current_employee if employee_signed_in?
  
      super do |resource|
        if resource.persisted?
          if employee_signed_in?
            sign_in(current_admin) if current_admin
            redirect_to employees_path, notice: "Employee #{resource.first_name} created successfully."
          else
            sign_in(resource)
            redirect_to employee_path(resource), notice: "Welcome, #{resource.first_name}!"
          end
          return 
        end
      end
    end
end
=begin
  Challenges faced:
  1. After registration, new employees were redirected to the login page instead of being signed in automatically.
  2. When an admin created a new employee, their session was replaced by the new employee's session.

  Solution:
  - Ensured newly registered employees are signed in automatically after registration.
  - Preserved the admin's session when creating a new employee.

=end