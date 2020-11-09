class Board
  attr_accessor :board, :game_over

  def initialize
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @game_over = false
  end

  def display_board
    puts
    puts "\nThis is game of Tic-Tac-Toe :)"
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts '--------'
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts '---------'
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    puts
  end

  def check_win
    if (@board[0] == @board[1]) && (@board[1] == @board[2])
      @game_over = true
      puts "#{@board[0]} win! Congrats :)"
    elsif (@board[3] == @board[4]) && (@board[4] == @board[5])
      @game_over = true
      puts "#{@board[3]} win! Congrats :)"
    elsif (@board[6] == @board[7]) && (@board[7] == @board[8])
      @game_over = true
      puts "#{@board[6]} win! Congrats :)"
    elsif (@board[0] == @board[3]) && (@board[3] == @board[6])
      @game_over = true
      puts "#{@board[0]} win! Congrats :)"
    elsif (@board[1] == @board[4]) && (@board[4] == @board[7])
      @game_over = true
      puts "#{@board[1]} win! Congrats :)"
    elsif (@board[2] == @board[5]) && (@board[5] == @board[8])
      @game_over = true
      puts "#{@board[2]} win! Congrats :)"
    elsif (@board[0] == @board[4]) && (@board[4] == @board[8])
      @game_over = true
      puts "#{@board[0]} win! Congrats :)"
    elsif (@board[2] == @board[4]) && (@board[4] == @board[6])
      @game_over = true
      puts "#{@board[6]} win! Congrats :)"
    elsif @board.all? { |a| a.is_a? String }
      @game_over = false
      puts 'This is a tie game!'
    else
      @game_over = false
      puts 'Next Player Turn!'
    end
  end
end

class Player
  attr_accessor :marker

  def initialize
    @marker = marker
  end
end

def play
  game = Board.new
  player1 = Player.new
  player2 = Player.new
  players = [player1, player2]

  puts 'What is your marker Player 1? X or O '
  player1.marker = gets.strip

  puts 'What is your marker Player 2? X or O'
  player2.marker = gets.strip

  players = [player1, player2]
  game = Board.new
  turns = 0

  while turns < 10
    count = turns % 2
    puts "\nPlayer #{count + 1}, what is your choice?"
    user_input = gets.strip.to_i

    while user_input < 1 || user_input > 9
      puts 'Please input a valid number!'
      user_input = gets.strip.to_i
    end

    while game.board[user_input - 1] == 'O' || game.board[user_input - 1] == 'X'
      puts 'This spot is already taken! Choose another spot!'
      user_input = gets.strip.to_i
    end

    game.board[user_input - 1] = players[count].marker
    game.display_board
    game.check_win
    turns += 1
    break if game.game_over == true

    puts
  end
end

p play
