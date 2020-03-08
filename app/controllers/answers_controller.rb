class AnswersController < ApplicationController
  
   before_action :redirect, only: :new
  
  def new
    @question = Question.find(params[:question_id])
    # params[:id]ではないのは_question~で定義しているkeyが:question_idだから
    # 本来はrails routesでみてuriで書かれている書き方にそうわけだが（だいたいuser/:idとかなってる）
    # ここではanswerのnewなので、その項目をみてもquestionのkeyが書かれていない。よって部分テンプレートで書いたkeyが書かれていた
    @answer = Answer.new
    @answer.question_id = @question.id
  end

  def create
    @answer = Answer.create(create_params)
  end

  def edit
    @answer = Answer.find(params[:id])
    @question = @answer.question
  end

  def update
    answer = Answer.find(params[:id])
    @question = answer.question
    answer.update(update_params)
  end

  private
  def create_params
    params.require(:answer).permit(:question_id, :text).merge(user_id: current_user.id)
  end
  
  def redirect
    if Answer.exists?(question_id: params[:question_id], user_id: current_user.id)
      redirect_to :root
    end
  end
  
  def update_params
    params.require(:answer).permit(:text)
  end
end
