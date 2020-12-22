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

  def words
    [
      ['Noel', 'Christmas in French'],
      ['Marie', 'The mother of Jesus'],
      ['Joseph', 'The father of Jesus'],
      ['Emmanuel', 'It means God is with us.'],
      ['Israel', 'The country of Jesus'],
      ['James', 'The brother of Jesus']
    ]
  end

  def print_teaser(last_guess = nil)
    update_teaser(last_guess) unless last_guess.nil?
    puts @word_teaser
  end

  def update_teaser(last_guess)
    new_teaser = @word_teaser.split
    
    new_teaser.each_with_index do |letter, index|
      current_letter = @word.first[index]
      new_teaser[index] = last_guess if letter == '_' && current_letter.downcase == last_guess.downcase
    end

    @word_teaser = new_teaser.join(' ')
  end

  def make_guess
    if @lives > 0
      puts 'Enter a letter.'
      guess = gets.chomp

      good_guess = @word.first.downcase.include? guess
      if guess == 'exit'
        puts "Thank you for your time."
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
        puts " Sorry... You have #{@lives} left. Try again"
        make_guess
      end
    else
      puts 'Game Over'
   end
  end

  def begin
    puts "New game started... the word is #{@word.first.size} characters long."
    puts 'You can type ex'
    puts "Your clue is #{@word.last}"
    print_teaser

    make_guess
  end
end

game = Hangman.new
game.begin
