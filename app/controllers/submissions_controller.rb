class SubmissionsController < ApplicationController
  before_action :authenticate_user!

  def new
    @assignment = Assignment.find(params[:assignment_id])
    @submission = Submission.new
  end

  def update
    @submission = Submission.find(params[:id])
    @submission.update(grade: params[:submission][:grade])
  end

  def create
    @assignment = Assignment.find(params[:assignment_id])
    @submission = @assignment.build_submission(
      content: params[:submission][:content],
      student: current_user
    )

    if @submission.save
      redirect_to assignments_path, notice: "Work submitted"
    else
      render :new
    end
  end
end
