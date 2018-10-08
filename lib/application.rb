require 'highline'
require_relative 'Console'
require_relative 'Game'
require_relative './models/Player'

highline = HighLine.new
console = Console.new(highline)

player1 = Player.new('X')
player2 = Player.new('Y')
game = Game.new(player1, player2)

console.print_board(game.board)
until game.has_ended?
  coordinates = console.request_move
  game.make_move(coordinates[0], coordinates[1])
  game.toggle_player
  console.print_board(game.board)
end

if game.winner != nil
  highline.say "The winner is #{game.winner.symbol}"
end
