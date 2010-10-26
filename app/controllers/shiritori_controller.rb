class ShiritoriController < ApplicationController

  before_filter :set_language

  def set_language
    @language = Language.find_by_name(params[:id])
    raise "no_select_language" if @language.nil?
  end

  def check_answer(question, answer)
    if question.terminal != answer[0, 1]
      flash[:ng_message] = "しりとりがつながりません"
      return
    end
    answer_method = @language.language_methods.find_by_name(answer)
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
      before_question = @language.language_methods.find(request[:question_id])
      if check_answer(before_question, params[:answer])
        next_question = @language.get_next_question(params[:answer])
        if next_question.nil?
          render :action => :giveup
        else
          @question = next_question
          session[:history].push @question.id
        end
      else
        @question = before_question
      end
    else
      @question = @language.get_random
      session[:history] = [@question.id]
    end
  end
end
