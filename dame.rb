# -*- coding: utf-8 -*-
class ChessBoard

  def initialize(size)
    @size = size
    @tokens = init_tokens
    # @plate = Array.new(size, Array.new(size, " "))
    @plate = create_plate
  end

  def init_tokens
    t = []
    t.push("╔") # 0
    t.push("╗") # 1
    t.push("╝") # 2
    t.push("╚") # 3
    t.push("╠") # 4
    t.push("╦") # 5
    t.push("╣") # 6
    t.push("╩") # 7
    t.push("║") # 8
    t.push("═") # 9
    t.push("╬") # 10
    t
  end

  def create_plate
    tab = []
    (1..@size).each do |num_line|
      line = []
      (1..@size).each do |num_column|
        line << " "
      end
      tab << line
    end
    tab
  end

  # Retourne le plateau de jeu
  def get_plate
    @plate
  end

  # Retourne le nombre de dames placées sur le plateau
  def get_queens
    queen = 0
    @plate.each do |line|
      line.each do |square|
        if is_queen?(square)
          queen += 1
        end
      end
    end
    queen
  end

  def insert_dame(line, column)
    if validate?(line, column)
      update(line, column)
      "dame insérée en (#{line},#{column})"
    else
      "impossible d'insérée une dame à cette endroit !"
    end
  end

  def display
    header_line
    first_line
    num_line = 1
    @plate.each do |line|
      display_line(line,num_line)
      if num_line != @size
        interline
      end
      num_line += 1    
    end
    footer_line
  end

  def have_still_possibilities?
    result = false
    line_index = 0
    column_index = 0
    while line_index < @size && !result
      while column_index < @size && !result
        if @plate[line_index-1][column_index-1] == " "
          result = true
        end
        column_index += 1
      end
      line_index += 1
    end
    result
  end

  private

  # mise à jour du plateau après insertion d'une dame
  def update(line, column)
    @plate[line-1][column-1] = "D"
    update_line(line)
    update_column(column)
    update_diagonal(line, column)
  end

  def update_line(line)
    @plate[line-1].each_with_index do |square, index|
      if square == " "
        @plate[line-1][index] = "-"
      end
    end
  end

  def update_column(column)
    (1..@size).each do |num|
      if @plate[num-1][column-1] == " "
        @plate[num-1][column-1] = "-"
      end
    end
  end

  def update_diagonal(line, column)
    (1..@size).each do |num|
      if existing_position?(line-num, column-num)
        if @plate[line-num-1][column-num-1] == " "
          @plate[line-num-1][column-num-1] = "-"
        end
      end

      if existing_position?(line-num, column+num)
        if @plate[line-num-1][column+num-1] == " "
          @plate[line-num-1][column+num-1] = "-"
        end
      end

      if existing_position?(line+num, column-num)
        if @plate[line+num-1][column-num-1] == " "
          @plate[line+num-1][column-num-1] = "-"
        end
      end

      if existing_position?(line+num, column+num)
        if @plate[line+num-1][column+num-1] == " "
          @plate[line+num-1][column+num-1] = "-"
        end
      end
    end
  end

  def is_queen?(square)
    square == "D"
  end

  def validate?(line, column)
    if existing_position?(line, column)
      @plate[line-1][column-1] == " "
    end
  end

  def existing_position?(line, column)
    line.between?(1, @size) && column.between?(1, @size)
  end

  def display_line(line, num_line)
    string = " #{num_line} #{@tokens[8]}"
    (1..@size).each do |num|
      string += " #{line[num-1]} #{@tokens[8]}"
    end
    string += "\n"
    print string
  end

  def header_line
    line = "     "
    (1..@size).each do |num|
      line += "#{num}   "
    end
    print line + "\n"
  end

  def first_line
    line = "   #{@tokens[0]}"
    (1..@size).each do |num|
      line += @tokens[9] + @tokens[9] + @tokens[9] + @tokens[5]
    end
    line[-1] = "#{@tokens[1]}\n"
    print line
  end

  def footer_line
    line = "   #{@tokens[3]}"
    (1..@size).each do |num|
      line += @tokens[9] + @tokens[9] + @tokens[9] + @tokens[7]
    end
    line[-1] = "#{@tokens[2]}\n"
    print line
  end

  def interline
    line = "   #{@tokens[4]}"
    (1..@size).each do |num|
      line += @tokens[9] + @tokens[9] + @tokens[9] + @tokens[10]
    end
    line[-1] = "#{@tokens[6]}\n"
    print line
  end

end
