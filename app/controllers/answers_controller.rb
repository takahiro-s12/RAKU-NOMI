class AnswersController < ApplicationController
  def new
    @answer = Answer.new
    @question = Question.find(params[:question_id])
    @answer.question_id = @question.id
    @group = Group.find(params[:group_id])
    @answer.group_id = @group.id
  end

  def create
    @answer = Answer.new
    @question = Question.find(params[:question_id])
    @answer.question_id = @question.id
    @group = Group.find(params[:group_id])
    @answer.group_id = @group.id
    @answer.status = 'true'
    @answer.user_id = current_user.id
    if @answer.save(answer_params)
      redirect_to group_question_path(@group, @question)
    else
      render new_group_question_answer_path(@group, @question)
    end
  end

  private

  def answer_params
    params.require(:answer).permit(:user_id, :group_id, :question_id, :first_candidate, :second_candidate, :final_candidate, :status)
  end
end
