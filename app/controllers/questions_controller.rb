class QuestionsController < ApplicationController
  def new
    @question = Question.new
    @group = Group.find(params[:group_id])
    @users = @group.users
  end

  def create
    @question = Question.new(question_params)
    @group = Group.find(params[:group_id])
    @question.group_id = @group.id
    @users = @group.users
    @question.user_ids = @users.ids
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

  def show
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question.id)
    @answers1 = Answer.where(question_id: @question.id, first_candidate: "true")
    @answers2 = @answers.where(second_candidate: 'true')
    @answers3 = @answers.where(final_candidate: 'true')
  end

  private

  def question_params
    params.require(:question).permit(:first_candidate,
                                     :second_candidate,
                                     :final_candidate,
                                     user_ids: []
                                    )
  end

end
