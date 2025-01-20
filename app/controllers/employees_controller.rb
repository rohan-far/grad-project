class EmployeesController < ApplicationController
    before_action :set_employee, only: %i[edit update destroy]

    def index
        @employees = Employee.all
    end

    def new
        @employee = Employee.new
    end

    def edit
    end

    def create
        @employee = Employee.new(employee_params)

        respond_to do |format|
            if @employee.save
                format.html {redirect_to employees_path, notice: "Employee is successfully created."}
                format.json {render :new, status: :created, location: @employee}
            else 
                format.html {render :new}
            end
        end
    end

    def update
        respond_to do |format|
            if @employee.update(employee_params)
                format.html {redirect_to employees_path, notice: "Employee is successfully updated."}
            else
                format.html {render :edit}
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
