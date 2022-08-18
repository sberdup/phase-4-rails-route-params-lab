class StudentsController < ApplicationController

  def index
    students = Student.all
    if params[:name] != nil
      # students = Student.where("first_name = ? OR last_name = ?", params[:name], params[:name])
      students = students.filter{|student| [student.first_name.downcase, student.last_name.downcase].include?(params[:name].downcase)}
    end
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student 
  end
end
