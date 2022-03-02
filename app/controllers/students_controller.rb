class StudentsController < ApplicationController
    wrap_parameters format: []
    def index  
        render json: Student.all , status: :ok
    end

    def show 
        student = find_student
        if student
            render json: student, status: :ok
        else 
            render json: {error: "Student not found"}, status: :not_found
        end
    end

    def create           
        createStudent = Student.create!(student_params)
        render json: createStudent, status: :created 
    end

    def update 
        student = find_student
        student.update!(student_params)
        render json: student, status: :ok
    end

    def destroy 
        student = find_student
        student.destroy 
        head :no_content
    end


    private
    def student_params
        params.permit(:name, :age, :major, :instructor_id)
    end 

    def find_student     
        student = Student.find_by(id: params[:id])  
    end 
end
