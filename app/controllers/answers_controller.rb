class AnswersController < ApplicationController
  
  def create
    @answer = Answer.new(answer_params.merge(user_id: current_user.id))
    if @answer.save
      redirect_to question_path(params[:answer][:question_id]), 
        notice: 'Answer was successfully created.'
    else
      redirect_to question_path(params[:answer][:question_id]), 
        alert: 'Something went wrong'
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:question_id, :content)
    end

end
