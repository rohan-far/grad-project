class EmployeesController < ApplicationController
    before_action :set_employee, only: %i[show edit update destroy]
    skip_before_action :authenticate_employee!, only: [:new, :create]


    def index
        if current_employee.admin?  
            authorize! :manage, Employee
            service = EmployeeService.list_all
            @employees = service[:employees].map(&:decorate) || []
        else
            redirect_to employee_path(current_employee), alert: "You can only view your own profile."
        end
    end

    def new
        @employee = Employee.new
        authorize! :create, @employee
    end

    def edit
        authorize! :update, @employee
    end

    def show
        if current_employee.admin? || current_employee.id == @employee.id
        else
            redirect_to root_path, alert: "You are not authorized to access this page."
        end
    end

    def create
        authorize! :create, @employee
        service = EmployeeService.create(employee_params)
        if service[:success]
            redirect_to employees_path, notice: "Employee successfully created."
        else 
            @employee = Employee.new(employee_params)
            render :new, status: :unprocessable_entity
        end
    end

    def update
        authorize! :update, @employee       
        service = EmployeeService.update(@employee, employee_params)
        if service[:success]
            redirect_to employees_path, notice: "Employee is successfully updated."
        else
            @employee = @employee
            render :edit
        end
    end
    
    def destroy
        authorize! :destroy, @employee
        EmployeeService.destroy(@employee)
            redirect_to employees_path, notice: 'Employee was successfully deleted.'
    end

    def send_invoices
        SendInvoicesJob.perform_later
        redirect_to employees_path, notice: "Invoices are being sent to employees."
    end

    private

    def set_employee
        @employee = Employee.find(params[:id]).decorate
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :department_id, :yearly_salary)
    end
end
