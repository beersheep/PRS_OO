require "pry"

class Player
  attr_accessor :choice, :name
  def initialize(name)
    @name = name
  end

  def to_s
    "#{name} choose #{Game::CHOICE[choice]}"
  end
end

class Human < Player
  def choose_hand
  
  begin
    puts "Please select your move"
    self.choice = gets.chomp.downcase
  end until Game::CHOICE.keys.include?(choice)

    self.choice = choice
  end
end

class Computer < Player
  def choose_hand
    self.choice = Game::CHOICE.keys.sample
  end
end


class Game
  attr_reader :player, :computer
  CHOICE = {"r" => "Rock", "p" => "Paper", "s" => "Scissors"}

  def initialize
    @player = Human.new("Player1")
    @computer = Computer.new("Computer")
  end

  def display_welcome_message
    puts "Welcome to the Paper, Rock, Scissors game!"
    puts "What's your name?"
    player.name = gets.chomp
  end

  def display_result
    if player.choice == computer.choice
      puts "It's a tie!"
    elsif (player.choice == "p" && computer.choice == "r") || 
          (player.choice == "r" && computer.choice == "s") ||
          (player.choice == "s" && computer.choice == "p")     
      puts "You win!"
    else 
      puts "You lose!"
    end
  end

  def play_again?
    puts "Would you like to play again? (y/n)"
    answer = gets.chomp.downcase
    true if answer == "y"
  end

  def play
    display_welcome_message

    loop do
      player.choose_hand
      computer.choose_hand
      puts player
      puts computer
      display_result
    break if !play_again?
    end
  end
end

Game.new.play

