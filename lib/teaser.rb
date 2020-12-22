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
