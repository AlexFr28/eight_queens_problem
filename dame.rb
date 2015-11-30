# -*- coding: utf-8 -*-
class ChessBoard

  def symbole_init
    @t = []
    @t.push("╔") # 0
    @t.push("╗") # 1
    @t.push("╝") # 2
    @t.push("╚") # 3
    @t.push("╠") # 4
    @t.push("╦") # 5
    @t.push("╣") # 6
    @t.push("╩") # 7
    @t.push("║") # 8
    @t.push("═") # 9
    @t.push("╬") # 10
    @t
  end

  def initialize(size)
    @size = size
    @plate = Array.new(size, 0)
    @symbole = symbole_init
  end

  # Retourne le plateau de jeu
  def get_plate
    @plate
  end

  # Retourne le nombre de dames placées sur le plateau
  def get_queens
    queen = 0
    @plate.each do |line|
      if line != 0
        queen += 1
      end
    end
    queen
  end

  def insert_dame(line, column)
    if validate?(line, column)
      @plate[line-1] = column
      "dame insérée en (#{line},#{column})"
    else
      "impossible d'insérée une dame à cette endroit !"
    end
  end

  def display
    header_line
    count = 1
    @plate.each do |line|
      display_line(line)
      if count != @size
        interline
      end
      count += 1    
    end
    footer_line
  end

  def display_array
    result = "["
    @plate.each do |line|
      result += "#{line},"
    end
    result[-1] = "]"
    print result
  end

  def have_still_possibilities?
    true
  end

  private

  def validate?(line, column)
    validate_line?(line) && validate_column?(column) && validate_diagonal?(line, column)
  end

  def validate_line?(line)
    if line.between?(1, @size)
      @plate[line-1] == 0
    else
      raise ArgumentError
    end
  end

  def validate_column?(column)
    if column.between?(1, @size)
      validate = true
      @plate.each do |line|
        if line == column
          validate = false
        end
      end
      validate
    else
      raise ArgumentError
    end
  end

  def validate_diagonal?(line, column)
    validate = true
    @plate.each do |line_plate|
      gap_line = line_plate - line
      if gap_line != 0 # si ==, ne sert à rien de le faire car même ligne de la dame que l'on veut insérer

        if (line + gap_line).between?(1, @size) # si on est bien sur le plateau
          if line_plate == column + gap_line
            validate = false
          end
        end

        if (line - gap_line).between?(1, @size) # si on est bien sur le plateau
          if line_plate == column - gap_line
            validate = false
          end
        end

      end
    end
    validate
  end

  def display_line(line)
    string = @t[8]
    count = 1
    (1..@size).each do |num|
      if count == line
        string += " D #{@t[8]}"
      else
        string += "   #{@t[8]}"
      end
      count += 1
    end
    string[-1] = "#{@t[8]}\n"
    print string
  end

  def header_line
    line = @t[0]
    (1..@size).each do |num|
      line += @t[9] + @t[9] + @t[9] + @t[5]
    end
    line[-1] = "#{@t[1]}\n"
    print line
  end

  def footer_line
    line = @t[3]
    (1..@size).each do |num|
      line += @t[9] + @t[9] + @t[9] + @t[7]
    end
    line[-1] = "#{@t[2]}\n"
    print line
  end

  def interline
    line = @t[4]
    (1..@size).each do |num|
      line += @t[9] + @t[9] + @t[9] + @t[10]
    end
    line[-1] = "#{@t[6]}\n"
    print line
  end

end
