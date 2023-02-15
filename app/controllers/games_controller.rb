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
    vowals = %w[A B E I O U Y].sample(4)
    consonants = %w[B C D F G H J K L M N P Q R S T V W X Z].sample(6)
    (vowals + consonants).shuffle
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
