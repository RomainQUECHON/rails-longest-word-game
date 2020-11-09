require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    alphabet = ("A".."Z").to_a
    @letters = alphabet.sample(10)
  end

  def score
    @score = 0
    @words = params[:words]
    response = open("https://wagon-dictionary.herokuapp.com/#{@words}")
    json = JSON.parse(response.read)
    @words_found = json['found']

    @words_included = @words.chars.all? { |word| @words.count(word) <= @letters.count(word) }
  end
end
