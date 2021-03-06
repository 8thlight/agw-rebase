require "core/player"

class CliPlayer < Player
  def initialize(symbol, output = $stdout, input = $stdin)
    super(symbol)
    @out = output
    @in = input
  end

  def get_move(board)
    @out.print "\nPlease input your move (tiles go from 0 to 8): "
    answer = @in.gets.chomp

    until valid_move?(answer, board)
      @out.print "Please input a valid move: "
      answer = @in.gets.chomp
    end
    answer.to_i
  end

  private

  def valid_move?(answer, board)
    regex = Regexp.new("^([0-#{board.total_tiles}])$")
    answer.match(regex) && board.free_tile?(answer.to_i)
  end
end
