require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = ('a'..'z').to_a.sample(10).join
  end

  def score
    url = 'https://wagon-dictionary.herokuapp.com/'
    user_serialized = open(url).read
    user = JSON.parse(user_serialized)

    if params[:letters].split('').include?(params[:word].split(''))
      if "https://wagon-dictionary.herokuapp.com/#{params[:word]}"
        @answer = "Congratulations! #{params[:word].upcase} is valid!"
      else
        @answer = "Sorry but #{params[:word].upcase} is not an English word..."
      end
    else
      @answer = "Sorryyyy it's not in the grid"
    end
  end
end
