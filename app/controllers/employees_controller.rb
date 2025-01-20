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
        @employee = Employee.new(employee_params)

        respond_to do |format|
            if @employee.save
                redirect_to employees_path, notice: "Employee successfully created."
            else 
                render :new
            end
        end
    end

    def update
        respond_to do |format|
            if @employee.update(employee_params)
                redirect_to employees_path, notice: "Employee is successfully updated."
            else
                render :edit
            end
        end
    end
    
    def destroy
        @employee.destroy!
        redirect_to employees_path, notice: 'Employee was successfully deleted.'
    end

    private

    def set_employee
        @employee = Employee.find(params[:id])
    end

    def employee_params
        params.require(:employee).permit(:first_name, :last_name, :email)
    end
end
