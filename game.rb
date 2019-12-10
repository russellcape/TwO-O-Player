require_relative 'question'
require_relative 'player'

class Game
  attr_accessor :current_player

  def initialize
    @player_1 = Player.new('Lucas')
    @player_2 = Player.new('Slav')
    @players = [@player_1, @player_2]
    @current_player = 0
  end

  def game_over?
    loser = @players.select {|player| player.lives == 0}
    if loser.length > 0
      true
    end
  end

  def start_round
    question = Question.new(@players[@current_player])
    question.ask
    answer = gets.chomp.to_i
    question.correct? answer
  end

  def update_lives (player, result)
    if !result
      player.lives -= 1
    end
  end

  def change_player
    if @current_player == 0
      @current_player = 1
    else
      @current_player = 0
    end
    puts "-------------- New Turn --------------" 
    unless game_over?
  end

  def game_stats
    puts " -------------- Stats -------------- "
    puts "P1: #{@players.first.lives}/3 vs P2: #{@players.last.lives}/3"
  end

  def end_game
    winner = @players.find {|player| player.lives > 0}
    puts "-------------- End Game --------------"
    puts "Player #{winner.name} wins with a score of #{winner.lives}/3"
  end

  def run_game
    puts "-------------- Run Game --------------"
    while !self.game_over? do
      result = start_round
      update_lives(@players[@current_player], result)
      game_stats
      change_player
    end
    end_game
  end
end