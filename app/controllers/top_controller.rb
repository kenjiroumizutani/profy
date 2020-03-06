class TopController < ApplicationController
  
  def index
     @question = Question.new
     @questions = current_user.group.questions
  #   ここの書き方がいまいちわからない。
  #   右辺は大文字から始まるものではないのか？
  #   Question.find(current_user.group)とかではないの？
  # アソシエーション組んでるからこれでいいんだっけ？
  end

end
