class DepartmentsController < ApplicationController
    before_action :set_department, only: %i[destroy]

    def index
        service = DepartmentService.list_all
        if service[:success]
            @departments = service[:departments]
        else
            @departments = []
        end
    end

    def new
        @department = Department.new
    end

    def create
        service = Department.create(department_params)
        if [:success]
            redirect_to departments_path, notice: 'Department was successfully created.'
        else
            render :new
        end
    end

    def destroy
        if @department.employees.exists?
          flash[:alert] = "Cannot delete department with associated employees."
        else
          @department.destroy
          flash[:notice] = "Department deleted successfully."
        end
      
        redirect_to departments_path
      end
      

    private

    def set_department
        @department = Department.find(params[:id])
    end
    
    def department_params
        params.require(:department).permit(:name)
    end
end
