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
    @guess = [ ]
  end

  def answer
    @all_colors.sample(4)
  end

  def guess_to_array
    if !@all_colors.include?(@user_guess)
      puts "That's not a color."
      get_guess
    else
      @guess << @user_guess
      get_guess
    end
  end

  def get_guess
    if @guess.length <= 3
      puts "Choose a color."
      @user_guess = gets.chomp.downcase
      puts @guess.length.inspect
      guess_to_array
    else
      return_answers
    end
  end

  def return_answers
    puts "HELLO!"
    if @answer == @guess
      puts "You win!"
    end

    if @answer.include?(@guess)
      puts "true"
    end
    #right_color = 0

    @answer.each_with_index do |color, index|
      if @guess == color
        puts "true"
      end
    end
    # @answer.each_with_index do |color, index|
    #   if @guess[index] == color[index]
    #     right_order += 1
    #     puts right_order
    #   end
    # end
  end

  def board
    #Array.new(4) {Array.new(10){"x"}}
  end
end

def run
  #until false
    new_game = MasterMind.new
    new_game.get_guess
  #end
end

run
