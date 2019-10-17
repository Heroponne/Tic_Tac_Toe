require 'bundler'
Bundler.require

require 'board_case'

# definit un plateau de jeu
class Board
  attr_accessor :board_case_array, :count_turn
  def initialize
  	boardc_A1 = BoardCase.new("1", " ")
  	boardc_A2 = BoardCase.new("2", " ")
  	boardc_A3 = BoardCase.new("3", " ")
  	boardc_B1 = BoardCase.new("4", " ")
  	boardc_B2 = BoardCase.new("5", " ")
  	boardc_B3 = BoardCase.new("6", " ")
  	boardc_C1 = BoardCase.new("7", " ")
  	boardc_C2 = BoardCase.new("8", " ")
  	boardc_C3 = BoardCase.new("9", " ")
  	@board_case_array = [boardc_A1, boardc_A2, boardc_A3, boardc_B1, boardc_B2, boardc_B3, boardc_C1, boardc_C2, boardc_C3]
  	@count_turn = 0
  end

  def play_turn(player)
  	puts "Que veux-tu faire, #{player.name} ? Choisis un numéro de case (1-9)"
  	print "> "
  	answer_number = gets.chomp.to_i
  	while answer_number != 1 && answer_number != 2 && answer_number != 3 && answer_number != 4 && answer_number != 5 && answer_number != 6 && answer_number != 7 && answer_number != 8 && answer_number != 9
      puts "ce n'est pas une case valable, rééssaie :"
      print "> :"
      answer_number = gets.chomp.to_i
    end
  	while @board_case_array[answer_number - 1].content == "o" || @board_case_array[answer_number - 1].content == "x" 
      puts "la place est déjà prise, rééssaie :"
      print "> :"
      answer_number = gets.chomp.to_i
    end
    @board_case_array[answer_number - 1].content = player.symbol
  	@count_turn += 1
  end 

  def victory?
    if ((@board_case_array[0].content == @board_case_array[1].content) && (@board_case_array[0].content == @board_case_array[2].content)) && (@board_case_array[0].content == "x" || @board_case_array[0].content == "o") || ((@board_case_array[3].content == @board_case_array[4].content) && (@board_case_array[3].content == @board_case_array[5].content)) && (@board_case_array[3].content == "x" || @board_case_array[3].content == "o") || ((@board_case_array[6].content == @board_case_array[7].content) && (@board_case_array[6].content == @board_case_array[8].content)) && (@board_case_array[6].content == "x" || @board_case_array[6].content == "o")|| ((@board_case_array[0].content == @board_case_array[3].content) && (@board_case_array[0].content == @board_case_array[6].content)) && (@board_case_array[0].content == "x" || @board_case_array[0].content == "o") || ((@board_case_array[1].content == @board_case_array[4].content) && (@board_case_array[1].content == @board_case_array[7].content)) && (@board_case_array[1].content == "x" || @board_case_array[1].content == "o") || ((@board_case_array[2].content == @board_case_array[5].content) && (@board_case_array[2].content == @board_case_array[8].content)) && (@board_case_array[2].content == "x" || @board_case_array[2].content == "o")|| ((@board_case_array[0].content == @board_case_array[4].content) && (@board_case_array[0].content == @board_case_array[8].content)) && (@board_case_array[0].content == "x" || @board_case_array[0].content == "o") || ((@board_case_array[2].content == @board_case_array[4].content) && (@board_case_array[2].content == @board_case_array[6].content) && (@board_case_array[2].content == "x" || @board_case_array[2].content == "o"))
      return true
    else
      return false
    end
  end
end
