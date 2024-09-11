require_relative "computer_code_guesser.rb"
require_relative "computer_code_maker.rb"
require_relative "human_code_guesser.rb"
require_relative "human_code_maker.rb"

possible_choices = ["blue","orange","green","purple"]

puts "Do you want to be code maker or code guesser? \n"
answer = gets.chop

if answer.downcase == "code guesser"
    code_maker = Computer_Code_Maker.new
    code = code_maker.make_a_code(possible_choices)
    code_guesser = Human_Code_Guesser.new
else
    code_maker = Human_Code_Maker.new
    code = code_maker.make_a_code(possible_choices)
    code_guesser = Computer_Code_Guesser.new(possible_choices)
end
8.times do 
    guess = code_guesser.make_a_guess
    code_maker.check_a_guess(guess,code_guesser)
    if code_guesser.correct_guesses == 4
        break
    else
        code_guesser.correct_guesses = 0
    end
end
if code_guesser.correct_guesses == 4
    puts "winner is code guesser"
else 
    puts "winner is code maker"
end
