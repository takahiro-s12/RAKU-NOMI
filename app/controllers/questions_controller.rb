class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @group = Group.find(params[:group_id])
  end

  def create
    @question = Question.new(question_params)
    @group = Group.find(params[:group_id])
    @question.group_id = @group.id
    if @question.save
      redirect_to group_path(@group)
    else
      render new_group_question_path(@group)
    end
  end

  def index
    @group = Group.find(params[:group_id])
    @questions = Question.where(group_id: @group.id)
  end

  private

  def question_params
    params.require(:question).permit(:first_candidate,
                                     :second_candidate,
                                     :final_candidate,
                                    )
  end

end
