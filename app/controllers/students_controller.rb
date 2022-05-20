class StudentsController < ApplicationController
  before_action :set_student, only: :show
  
  def index
    @students = Student.all
  end

  def show
    set_student
    @student.active ? @status = "active" : @status = "inactive"
  end

  def activate
    set_student
    @student.active = !@student.active
    @student.save
    render :show, locales: {id: @student.id}
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end