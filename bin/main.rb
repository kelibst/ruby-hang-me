require_relative '../lib/teaser.rb'
require_relative '../lib/words.rb'

class Hangman
  def initialize
    @letters = ('a'..'z').to_a
    @word = words.sample
    @lives = 3

    @word_teaser = ''

    @word.first.size.times do
      @word_teaser += '_ '
    end
  end

  def make_guess
    if @lives.positive?
      puts 'Enter a letter.'
      guess = gets.chomp

      good_guess = @word.first.downcase.include? guess
      if guess == 'exit'
        puts 'Thank you for your time.'
      elsif good_guess
        puts 'You are correct!'

        print_teaser(guess)
        if @word.first.downcase == @word_teaser.split.join.downcase
          puts 'Congratulations... you won the game!'
        else
          make_guess
        end
      else
        @lives -= 1
        puts " Sorry... You have #{@lives} more chances. Try again"
        make_guess
      end
    else
      puts 'Game Over'
    end
  end

  def begin
    puts "New game started... the word is #{@word.first.size} characters long."
    puts 'Enter exit to exit the game.'
    puts "Your clue is #{@word.last}"
    print_teaser

    make_guess
  end
end

game = Hangman.new
game.begin
