class AbstractShiritoriController < ApplicationController

  before_filter :set_method_model

  def check_answer(question, answer)
    if question.terminal != answer[0, 1]
      flash[:ng_message] = "しりとりがつながりません"
      return
    end
    answer_method = @method_model.find_by_name(answer)
    if answer_method.nil?
      flash[:ng_message] = "#{answer}というメソッドはありません"
      return
    elsif session[:history].index(answer_method.id)
      flash[:ng_message] = "#{answer}は既に使いました"
      return
    else
      session[:history].push answer_method.id
    end
    flash[:ng_message] = nil
    true
  end

public

  def index
    if request[:question_id] && request[:answer]
      before_question = @method_model.find(request[:question_id])
      if check_answer(before_question, params[:answer])
        @question = @method_model.get_next_question(params[:answer])
        session[:history].push @question.id 
      else
        @question = before_question
      end
    else
      @question = @method_model.get_random
      session[:history] = [@question.id]
    end
  end

end
