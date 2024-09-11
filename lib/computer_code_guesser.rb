class Computer_Code_Guesser
    attr_accessor :keep_a_guess, :colors_to_keep, :correct_guesses
    def initialize(possible_choices)
        @correct_guesses = 0 
        @keep_a_guess = [false,false,false,false]
        @colors_to_keep = []
        @guesses = []
        @possible_choices = possible_choices
    end
    def make_a_guess
        i = 0
        while i<4
            if @keep_a_guess[i] != true
                if @colors_to_keep.length > 0
                    puts @colors_to_keep.length
                    @guesses[i] = @colors_to_keep.sample
                    @colors_to_keep.pop
                else
                    @guesses[i] = @possible_choices.sample
                end
            end
            i = i + 1
        end
        return @guesses
    end
end