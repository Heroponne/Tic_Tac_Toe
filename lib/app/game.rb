require 'bundler'
Bundler.require

require 'player'
require 'board'

# definit le deroulement d'une partie
class Game
  attr_accessor :current_player, :status, :board, :players
  def initialize
  	puts "Bonjour, quel est ton prénom, premier joueur ?"
    print "> "
    answer = gets.chomp

    player1 = Player.new(answer, "x")

    puts "Et toi, deuxième joueur ?"
    print "> "
    other_answer = gets.chomp

    player2 = Player.new(other_answer, "o")

    puts "Bienvenue à #{player1.name} et #{player2.name} !! Le symbole de #{player1.name} sera #{player1.symbol} et le symbole de #{player2.name} sera #{player2.symbol}"
    @players = [player1, player2]
    @board = Board.new
    @status = "on going"
  end

  def turn
  	while @board.victory? == false && @board.count_turn < 9
  	  @players.each do |player|
  	  	@current_player = player
  	    puts "Voici les numéros des cases :"
  	    puts ""
        puts " 1 | 2 | 3 "
        puts " –––––––––– "
        puts " 4 | 5 | 6 "
        puts " –––––––––– "
        puts " 7 | 8 | 9 "
        puts ""
        puts "Voici l'état actuel de la partie :"
  	    puts ""
        puts " #{@board.board_case_array[0].content} | #{@board.board_case_array[1].content} | #{@board.board_case_array[2].content} "
        puts " –––––––––– "
        puts " #{@board.board_case_array[3].content} | #{@board.board_case_array[4].content} | #{@board.board_case_array[5].content} "
        puts " –––––––––– "
        puts " #{@board.board_case_array[6].content} | #{@board.board_case_array[7].content} | #{@board.board_case_array[8].content} "
        puts ""
        @board.play_turn(player)
        break if @board.victory? == true || @board.count_turn > 8
      end
  	end
  	puts ""
    puts " #{@board.board_case_array[0].content} | #{@board.board_case_array[1].content} | #{@board.board_case_array[2].content} "
    puts " –––––––––– "
    puts " #{@board.board_case_array[3].content} | #{@board.board_case_array[4].content} | #{@board.board_case_array[5].content} "
    puts " –––––––––– "
    puts " #{@board.board_case_array[6].content} | #{@board.board_case_array[7].content} | #{@board.board_case_array[8].content} "
    puts ""
    if board.victory? == true
      return true
    elsif board.count_turn > 8
      return false
    end
  end

  def game_end
  	if turn == true 
  	  puts "#{@current_player.name} a gagné !"
  	elsif turn == false
  	  puts "Match nul..."
  	end
  end

  def new_round
  	puts "Voulez-vous refaire une partie ?"
  	puts "Y/N"
  	print "> "
  	answer = gets.chomp.to_s
  	if answer == "Y"
  	  puts "OK, on y retourne !"
  	  return true
  	else
  	  puts "Merci d'avoir joué ! :)"
  	  return false
  	end
    @board = Board.new
  end
end







