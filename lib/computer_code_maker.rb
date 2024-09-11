class Computer_Code_Maker
    #superclasssssssss
    def initialize
        @code = []
        @green_pegs = 0
        @yellow_pegs = 0
    end
    def make_a_code(possible_choices)
        4.times {@code.push(possible_choices.sample)}
        @code = ["blue","green","purple","green"]
        print " #{@code} \n"
        return @code
    end 
    def check_a_guess(guesses,code_guesser)
        # Defined in order to check for matching color values regardless of postion since then 
        # already matched color values should be removed
        code_for_testing = @code.dup
        @green_pegs = 0
        @yellow_pegs = 0
        guesses.each_with_index do |color,index|
            puts "Here is current code that is guessed #{@code} \n"
            puts "here is current color at the beggining of check #{color} \n"
            puts "here is current index at the beggining of check #{index} \n"
            puts "Here is second code being guessed too #{code_for_testing} \n"

            if @code[index] == color
                puts "green peg entered \n"
                code_guesser.correct_guesses += 1
                @green_pegs += 1 
                code_for_testing.delete_at(code_for_testing.index(color))
            elsif code_for_testing.include?(color)
                puts "yellow peg entered \n"
                code_for_testing.delete_at(code_for_testing.index(color))
                @yellow_pegs += 1
            end
            puts "here is current color at the end of check #{color} \n"
            puts "here is current index at the end of check #{index} \n"
        end
        print_a_result()
    end
    def print_a_result()
        print "There are #{@green_pegs} green pegs and #{@yellow_pegs} yellow pegs \n"
    end
end