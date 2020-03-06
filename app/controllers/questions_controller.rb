class QuestionsController < ApplicationController
  
  def create
    Question.create(create_params)
    redirect_to :root and return
    # createしたあとにトップに戻るようにリダイレクト
    # redirect_to :rootだけではアクション内の処理は終了せず次のコードにいってしまう
    # redirect_to :root and returnと書くのがベター
  end

  private
  def create_params
    params.require(:question).permit(:text).merge(user_id: current_user.id, group_id: current_user.group_id)
  end
  
end
