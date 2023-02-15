class GamesController < ApplicationController
  before_action :set_letters, :answer_input
  def new
  end

  #definir o que eh a ARRAY com a API dada no kitt
  def score
    unless @letters.include?(@input_answer.chars) && ARRAY.include?(@input_answer)
      puts "Sorry but #{params[:input_answer]} can't be built out of #{@letters.join(', ')}"
  end

private

  def set_letters
    @letters = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z].sample(10)
  end

  def answer_input
    @input_answer = params[:input_answer]
  end
end
