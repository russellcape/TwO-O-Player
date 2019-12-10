class Question
  attr_reader :question, :answer

  def initialize (player)
    @player = player
  end

  def ask
    make_question
    puts question
  end

  def correct? (answer)
    if answer == @answer
      puts "Your answer was #{answer}. Great job, you are correct!"
      true
    else
      puts "Your answer was #{answer}. Unfortunatly, the correct answer is #{@answer}."
      false
    end
  end

private

  def make_question
    x = rand(1..20)
    y = rand(1..20)
    @question = "#{@player.name}: What does #{x} plus #{y} equal?"
    @answer = x + y
  end

end