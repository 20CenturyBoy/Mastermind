class Human_Code_Maker
    def initialize
        @code = []
        @green_pegs = 0
        @yellow_pegs = 0
    end
    def make_a_code(possible_choices)
        @code = []
        code_unit = nil
        i = 0
        while i < 4 do
            puts "Input code:"
            code_unit = gets.chop
            if !(possible_choices.include?(code_unit))
                puts "Please input valid code unit"
                next
            end
            @code.push(code_unit)
            i = i+1
        end 
        return @code
    end
    def check_a_guess(guesses,code_guesser)
        # Defined in order to check for matching color values regardless of postion since then 
        # already matched color values should be removed
        code_for_testing = @code.dup
        puts "Here is a code that you have defined #{@code}"
        puts "Here is code for testing before it is used to check for green/yellow pegs #{code_for_testing}"
        @green_pegs = 0
        @yellow_pegs = 0
        guesses.each_with_index do |color,index|
            puts "Here is a current guess units color #{color} and here is current index/place whose color is guessed #{index}"
            if @code[index] == color
                code_guesser.correct_guesses += 1
                @green_pegs += 1 
                puts "Here is green pegs correctly guessed color #{color} as well as correct index #{index}"
                if !code_for_testing.include?(color)
                    @yellow_pegs -= 1
                    code_guesser.colors_to_keep.delete_at(code_guesser.colors_to_keep.index(color))
                else   
                    code_for_testing.delete_at(code_for_testing.index(color))
                end
                code_guesser.keep_a_guess[index] = true
                puts "Here is code fore testing after its modifed by green peg deleting specficicaly #{code_for_testing}"
            elsif code_for_testing.include?(color)
                puts "Now this is when guessed color is correct its somewhere in code but not at this place"
                code_for_testing.delete_at(code_for_testing.index(color))
                puts "Here is how code for testing is modifed by removing said color from pool used for yellow pegs testing #{code_for_testing}"
                @yellow_pegs += 1
                code_guesser.colors_to_keep.push(color)
            end
        end
        print_a_result()
    end
    def print_a_result()
        print "There are #{@green_pegs} green pegs and #{@yellow_pegs} yellow pegs \n"
    end
end