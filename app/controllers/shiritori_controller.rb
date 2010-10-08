class ShiritoriController < ApplicationController

  def all_methods
    Object.methods
  end

  def get_next_question
    all_methods.sort_by{|m| rand}.first
  end

  def check_question(question, answer)
    if question[question.length - 1, 1] != answer[0, 1]
      flash[:ng_message] = "しりとりがつながりません"
      return
    end
    unless all_methods.index(answer)
      flash[:ng_message] = "そんなメソッドありません"
      return
    end
    true
  end

public

  def index
    if request[:question] && request[:answer]
      if check_question(params[:question], params[:answer])
        @question = get_next_question
      else
        @question = params[:question]
      end
    else
      @question = get_next_question
    end
  end

end
