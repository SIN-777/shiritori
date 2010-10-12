class ShiritoriController < ApplicationController

  def get_new_question
    RubyMethod.all.sort_by{|m| rand}.first
  end

  def get_next_question(answer)
    RubyMethod.find_all_by_initial(answer[answer.length - 1, 1]).sort_by{|m| rand}.first
  end

  def check_answer(question, answer)
    if question.terminal != answer[0, 1]
      flash[:ng_message] = "しりとりがつながりません"
      return
    end
    unless RubyMethod.find_by_name(answer)
      flash[:ng_message] = "そんなメソッドありません"
      return
    end
    true
  end

public

  def index
    if request[:question_id] && request[:answer]
      before_question = RubyMethod.find(request[:question_id])
      if check_answer(before_question, params[:answer])
        @question = get_next_question(params[:answer])
      else
        @question = before_question
      end
    else
      @question = get_new_question
    end
  end

end
