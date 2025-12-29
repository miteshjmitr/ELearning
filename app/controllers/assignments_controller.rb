class AssignmentsController < ApplicationController
  before_action :authenticate_user!
  before_action :teacher_only, only: [:new, :create]

  def new
    @assignment = Assignment.new
    @students = User.student
  end

  def create
    @assignment = current_user.given_assignments.build(assignment_params)

    if @assignment.save
      redirect_to assignments_path, notice: "Assignment created"
    else
      @students = User.student
      render :new
    end
  end

  def index
    if current_user.teacher?
      @assignments = current_user.given_assignments
    else
      @assignments = current_user.received_assignments
    end
  end

  private

  def assignment_params
    params.require(:assignment)
          .permit(:title, :description, :student_id)
  end

  def show
    @assignment = Assignment.find(params[:id])
    @submission = @assignment.submission
  end


  def teacher_only
    redirect_to root_path, alert: "Access denied" unless current_user.teacher?
  end
end
