class ShiritoriController < ApplicationController

  def check_answer(question, answer)
    if question.terminal != answer[0, 1]
      flash[:ng_message] = "しりとりがつながりません"
      return
    end
    unless RubyMethod.find_by_name(answer)
      flash[:ng_message] = "そんなメソッドありません"
      return
    end
    flash[:ng_message] = nil
    true
  end

public

  def index
    if request[:question_id] && request[:answer]
      before_question = RubyMethod.find(request[:question_id])
      if check_answer(before_question, params[:answer])
        @question = RubyMethod.get_next_question(params[:answer])
      else
        @question = before_question
      end
    else
      @question = RubyMethod.get_random
    end
  end

end
