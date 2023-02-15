require "json"
require "open-uri"

class GamesController < ApplicationController
  def new
    @letters = set_letters
  end

  def score
    @letters = params[:letters].split
    @input_answer = params[:input_answer].upcase
    @input_letters = @input_answer.chars
    @english_words = english_word(@input_answer)
    @include = include?(@input_letters, @letters)
  end


  private

  def set_letters
    %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z].sample(10)
  end

  def include?(input_letters, letters)
    (input_letters - letters).empty?
  end

  def english_word(input_answer)
    # metodo para obter o dicionário de palavras inglesas por meio do parse de um arquivo em formato json
    url = "https://wagon-dictionary.herokuapp.com/#{input_answer}"
    response = URI.open(url)
    json = JSON.parse(response.read)
    json['found']
  end
end
