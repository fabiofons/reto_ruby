class Questions

    attr_accessor :definitions, :answers    

    def initialize
        @definitions = []
        @answers = []
        make_questions
    end

    #private
    def make_questions
        indicator = 0
        File.foreach("questions.txt") do |line|
            if indicator.even?
                @definitions << line.chomp
            elsif
                @answers << line.chomp
            end 
                indicator += 1
        end
    end   
end

class Game 
    attr_reader :question, :guess
    def initialize(question)
        @question = question.definitions
        @guess = question.answers
        run
    end
    
    def run
        num_pregunta = 0
        puts
        puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"      
        puts "Pregunta #{num_pregunta+1}: "        
        puts @question[num_pregunta]

        while num_pregunta < 5
            print "Adivinar: "
            user_answer = gets.chomp.capitalize
            if user_answer == @guess[num_pregunta]
                puts "Correcto!"
                num_pregunta += 1
                 
                puts @question[num_pregunta]
            else
                puts "Incorrecto!, Trata de nuevo"    
            end
            if num_pregunta < 5
                puts "Pregunta #{num_pregunta+1}: "
            end
        end
        puts "Felicitaciones!! Adivinaste todas las preguntas :)"
    end
end


question = Questions.new
game = Game.new(question)

  