#TO DO
#DONEcreate a random combination of 4 colors from 8 colors
#DONEallow for guesses
#DONErespond to guesses - number of correct colors and number of colors in correct order

#create a board/reprint board

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
    @number_of_guesses = 0
    @win = false
    @lose = false
    @right_color = 0
    @right_order = 0
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
      guess_to_array
    else
      number_of_guesses
    end
  end

  def number_of_guesses
    if @number_of_guesses <= 8
      @number_of_guesses += 1
    else
      lose
    end
    return_results
  end

  def return_results
      @answer.each_with_index do |color, index|
        if @guess.include?(color)
          @right_color += 1
        end
      end

      if @guess[0] == @answer[0]
        @right_order += 1
      end

      if @guess[1] == @answer[1]
        @right_order += 1
      end

      if @guess[2] == @answer[2]
        @right_order += 1
      end

      if @guess[3] == @answer[3]
        @right_order += 1
      end

      # if @right_order == 4
      #   win
      # end

      puts "You have #{@right_color} correct colors."
      puts "And #{@right_order} in the correct spot."
  end

  def reset_results
    @right_color = 0
    @right_order = 0
    @guess = []
  end

  def board
  end

  def lose
    if @number_of_guesses == 9
      @lose = true
      abort("You have lost.")
    end
  end

  def win
  end
end

def run
    mm = MasterMind.new

  until mm.lose == true
    puts mm.inspect
    mm.reset_results
    mm.get_guess
  end
end

run
