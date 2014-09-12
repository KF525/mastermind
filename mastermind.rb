#TO DO
#DONEcreate a random combination of 4 colors from 8 colors
#create a board/reprint board
#allow for guesses
#respond to guesses - number of correct colors and number of colors in correct order
#a way to quit the game
#an end to the game
#option to increase difficulty/reduce number of guesses
#inclide colorize option

require 'colorize'

class MasterMind
  def initialize
    @all_colors = ["red", "blue", "black", "yellow", "green", "white", "orange", "brown"]
    @answer = answer
    @guess = []
  end

  def answer
    @all_colors.sample(4)
  end

  def make_guess_array(guessed_colors)
    @guess << guessed_colors
    check_guess
  end

  def check_guess
    if @answer == @guess
      puts "true"
    end
  end

  def board
    #Array.new(4) {Array.new(10){"x"}}
  end
end

def run
  new_game = MasterMind.new
  puts new_game.board
  puts new_game.inspect
  puts "What is your color choice for spot one?"
  guess = gets.chomp.downcase
  new_game.make_guess_array(guess)
  puts "What is your color choice for spot two?"
  guess = gets.chomp.downcase
  new_game.make_guess_array(guess)
  puts "What is your color choice for spot three?"
  guess = gets.chomp.downcase
  new_game.make_guess_array(guess)
  puts "What is your color choice for spot four?"
  guess = gets.chomp.downcase
  new_game.make_guess_array(guess)
end

run
