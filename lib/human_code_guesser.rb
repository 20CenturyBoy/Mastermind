class Human_Code_Guesser
    attr_accessor :correct_guesses
    def initialize
        @correct_guesses = 0 
        @guesses  = []
    end
    def make_a_guess
        i=0
        @guesses  = []
        4.times do
            i= i+1
            puts "Please input your guess for position #{i}? \n"
            current_guess = gets.chop
            @guesses.push(current_guess)
        end
        return @guesses 
    end
end