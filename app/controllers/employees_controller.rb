class EmployeesController < ApplicationController
    before_action :set_employee, only: %i[show edit update destroy]

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def edit
    end

    def show
    end

    def create
        result = EmployeeService.create(employee_params)
        if result[:success]
            redirect_to employees_path, notice: "Employee successfully created."
        else 
            @employee = Employee.new(employee_params)
            render :new, status: :unprocessable_entity
        end
    end

    def update
        result = EmployeeService.update(@employee, employee_params)
        if result[:success]
            redirect_to employees_path, notice: "Employee is successfully updated."
        else
            @employee = @employee
            render :edit
        end
    end
    
    def destroy
        EmployeeService.destroy(@employee)
            redirect_to employees_path, notice: 'Employee was successfully deleted.'
    end

    def send_invoices
        SendInvoicesJob.perform_later
        redirect_to employees_path, notice: "Invoices are being sent to employees."
    end

    private

    def set_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email, :department_id, :yearly_salary)
    end
end
