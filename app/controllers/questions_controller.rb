class QuestionsController < ApplicationController
  before_action :authenticate_user!

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
      @question.create_notification_question!(current_user)
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def index
    @group = Group.find(params[:group_id])
    @questions = Question.where(group_id: @group.id).order("created_at DESC")
    @questions = @questions.page(params[:page]).per(10)
  end

  def show
    @group = Group.find(params[:group_id])
    @question = Question.find(params[:id])
    @answers = Answer.where(question_id: @question.id)
    @answers1 = Answer.where(question_id: @question.id, first_candidate: "true")
    @answers2 = @answers.where(second_candidate: 'true')
    @answers3 = @answers.where(final_candidate: 'true')
    @done_answers = Answer.where(question_id: @question, status: true)
  end

  private

  def question_params
    params.require(:question).permit(:title,
                                     :first_candidate,
                                     :second_candidate,
                                     :final_candidate,
                                     user_ids: [])
  end
end
