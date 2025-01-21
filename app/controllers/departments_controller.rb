class DepartmentsController < ApplicationController
    before_action :set_department, only: %i[edit update destroy]

    def index
        @departments = Department.all
    end

    def new
        @department = Department.new
    end

    def create
        @department = Department.new(department_params)

        if @department.save
            redirect_to departments_path, notice: 'Department was successfully created.'
        else
            render :new
        end
    end

    def edit
    end

    def destroy
        @department.destroy!
        redirect_to departments_path, notice: 'Department was successfully deleted.'
    end


    private

    def set_department
        @department = Department.find(params[:id])
    end
    
    def department_params
        params.reqiure(:department).permit(:name)
    end
end
