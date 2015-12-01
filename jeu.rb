require_relative 'dame'
require 'pry'

size = 0
if ARGV.count != 0
  size = ARGV.pop.to_i
end

while size < 1
  system "clear"
  puts "Bonjour, quelle taille de plateau voulez-vous (de 1 à 10) ?"
  size = gets.chomp.to_i
end

# création du plateau de jeu
chess_board = ChessBoard.new(size)
# chess_board.get_queens
message = "Début de la partie\n"
while chess_board.have_still_possibilities?
  system "clear"
  puts message
  chess_board.display
  puts "#{chess_board.get_queens} dame(s) placée(s)"
  puts "Où voulez-vous placer la prochaine dame :"
  print "ligne ? "
  line = gets.chomp.to_i
  print "colonne ? "
  column = gets.chomp.to_i

  message = chess_board.insert_dame(line, column)
end

system "clear"
chess_board.display
puts "Tu as réussi à placer #{chess_board.get_queens} dames"



# system "clear"
# puts chess_board.insert_dame(1,2)
# chess_board.display

# puts chess_board.insert_dame(2,4)
# chess_board.display

# puts chess_board.insert_dame(3,1)
# chess_board.display

# puts chess_board.insert_dame(4,3)
# chess_board.display
