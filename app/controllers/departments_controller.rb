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
        service = DepartmentService.create(department_params)
        if service[:success]
            redirect_to departments_path, notice: 'Department was successfully created.'
        else
            render :new
        end
    end

    def destroy
        service = DepartmentService.destroy!(@department)
        
    end
      

    private

    def set_department
        @department = Department.find(params[:id])
    end
    
    def department_params
        params.require(:department).permit(:name)
    end
end
