require_relative 'dame'

size = 0
if ARGV.count != 0
  size = ARGV.pop.to_i
end

while size < 1 || size > 10
  system "clear"
  puts "Bonjour, quelle taille de plateau voulez-vous (de 1 à 10) ?"
  size = gets.chomp.to_i
end

# création du plateau de jeu
chess_board = ChessBoard.new(size)

message = "           Début de la partie\n"
while chess_board.have_still_possibilities?
  system "clear"
  puts "#{message}\n"
  chess_board.display
  puts "\n #{chess_board.get_queens} dame(s) placée(s)"
  puts "\n Où voulez-vous placer la prochaine dame :"
  print " ligne : "
  line = gets.chomp.to_i
  print " colonne : "
  column = gets.chomp.to_i

  message = "#{chess_board.insert_dame(line, column)}\n"
end

system "clear"
chess_board.display
puts "Tu as réussi à placer #{chess_board.get_queens} dames"
