class Questions
  attr_reader :question, :answer

  def initialize (player)
    @player = player
  end

  def ask
    ask_question
    puts question
  end

  def correct? (answer)
    if answer == @answer
      puts 'Great Job!!! You are correct!'
      true
    else
      puts 'Sorry... Your answer was incorrect.'
      false
  end

end