class Questions

    attr_accessor :definitions, :answers    

    def initialize
        @definitions = []
        @answers = []
        make_questions
    end

    private
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

puts "Bienvenido a reto 5, Para jugar, solo ingresa el termino correcto para cada una de las definiciones, Listo? Vamos!"      
game = Questions.new
puts "Pregunta"
num_pregunta = 0
puts game.definitions[num_pregunta]
while num_pregunta < 5
    print "Adivinar: "
    user_answer = gets.chomp.capitalize
    if user_answer == game.answers[num_pregunta]
        puts "Correcto!"
        num_pregunta += 1
        puts game.definitions[num_pregunta]
    else
        puts "Incorrecto!, Trata de nuevo"    
    end
end
puts "Felicitaciones!! Adivinaste todas las preguntas :)"

  