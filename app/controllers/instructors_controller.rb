class InstructorsController < ApplicationController
    wrap_parameters format: []
    def index  
        render json: Instructor.all, status: :ok
    end

    def show  
        instructor= find_instructor
        if instructor
            render json: instructor, status: :ok
        else  
            render json: {error: "Instructor not found"}, status: :not_found
        end
    end

    def create 
        createInstructor = Instructor.create!(instructor_params)
        render json: createInstructor, status: :created
    end

    def update 
        instructor =find_instructor
        instructor.update!(instructor_params)
        render json: instructor, status: :ok
    end

    def destroy 
        instructor =find_instructor
        instructor.destroy 
        head :no_content
    end


    private
    def instructor_params
        params.permit(:name)
    end  

    def find_instructor
        instructor = Instructor.find_by(id: params[:id])
    end
end
