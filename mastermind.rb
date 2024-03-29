require 'colorize'

class MasterMind
  def initialize
    @all_colors = ["red", "blue", "yellow", "green", "white", "magenta", "cyan"]
    @all_colors_in_color = colorize_choices
    @answer = answer
    @guess = [ ]
    @number_of_guesses = 0
    @over = false
    @right_color = 0
    @right_order = 0
    @level = 10
    @game_piece = nil
    @row = []
  end

  def answer
    @all_colors.sample(4)
  end

  def colorize_pieces
    add_color = @user_guess.to_sym

    @game_piece = "O".colorize(add_color)
    @row << @game_piece
    get_guess
  end

  def colorize_choices
    @all_colors.map do |n|
      n.colorize(n.to_sym)
    end
  end

  def guess_to_array
    if !@all_colors.include?(@user_guess) && @user_guess != "quit"
      puts "That's not a color."
      get_guess
    elsif @user_guess == "quit"
      abort("You have ended the game.")
    else
      @guess << @user_guess
      colorize_pieces
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

  def level_of_difficulty(level)
    if level.include?("easy")
      @level = 10
      puts "You have 10 guesses."
    elsif level.include?("medium")
      @level = 8
      puts "You have 8 guesses."
    elsif level.include?("hard")
      @level = 5
      puts "You have 5 choices."
    else
      puts "I'm sorry. I don't understand."
    end
  end

  def number_of_guesses
    if @number_of_guesses <= @level
      @number_of_guesses += 1
    else
      over
    end
    return_results
  end

  def return_results
    #I'm having trouble combining these two each statements.
      @answer.each_with_index do |color, index|
        if @guess.include?(color)
          @right_color += 1
        end
      end

      @answer.each_with_index do |color, index|
        if @guess[index] == @answer[index]
          @right_order += 1
        end
      end

      if @answer == @guess
        over
      end

      puts "You have #{@right_color} correct colors."
      puts "And #{@right_order} in the correct spot."
  end

  def reset_results
    @right_color = 0
    @right_order = 0
    @guess = []
  end

  def board
    puts "Possible colors: #{@all_colors_in_color.join(", ")}"

    #I want to find a more successful way to represent the board
    puts @row
  end

  def over
    case
    when @number_of_guesses == @level
      puts "I'm sorry. You have lost Mastermind."
      puts "The correct combination was #{@answer.join(', ')}."
      @lose = true
    when @right_order == 4
      puts "You win!"
      @win = true
    end
  end
end

def run
    mm = MasterMind.new

    puts "There is a secret combination of 4 colors."
    puts "You must try and guess the secret combination to win."
    puts "To quit the game just type QUIT."
    puts "What level of difficulty would you like: easy, medium, hard?"
    level = gets.chomp.downcase
    mm.level_of_difficulty(level)

  until mm.over == true
    puts mm.board
    mm.reset_results
    mm.get_guess
  end
  puts mm.board
end

run
