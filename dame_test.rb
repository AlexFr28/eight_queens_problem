require 'minitest/autorun'
require_relative 'dame'
require 'pry'

class TestDame < Minitest::Test

  def dame_vide
    Dame.new(4)
  end

  def dame_1_1
    dame = Dame.new(4)
    dame.set_dame(1, 1)
    dame
  end

  def test_false
    assert_equal false, false
  end

  def test_plate_empty
    # skip
    assert_equal [0, 0, 0, 0], dame_vide.get_plate
  end

  def test_set_dame_error_number_of_line_0
    # skip
    dame = dame_vide
    assert_raises(ArgumentError) { dame.set_dame(0, 1) }
  end

  def test_set_dame_error_number_of_line_5
    # skip
    dame = dame_vide
    assert_raises(ArgumentError) { dame.set_dame(5, 1) }
  end

  def test_set_dame_error_number_of_column_0
    # skip
    dame = dame_vide
    assert_raises(ArgumentError) { dame.set_dame(1, 0) }
  end

  def test_set_dame_error_number_of_column_5
    # skip
    dame = dame_vide
    assert_raises(ArgumentError) { dame.set_dame(1, 5) }
  end

  def test_set_dame_1_1
    # skip
    dame = dame_vide
    # dame.display
    assert_equal "dame insérée en (1,1)", dame.set_dame(1, 1)
  end

  def test_set_dame_1_1_and_2_3
    # skip
    dame = dame_1_1
    dame.set_dame(2, 3)
    assert_equal [1, 3, 0, 0], dame.get_plate
  end

  def test_set_dame_error_1_1_and_2_2
    # skip
    dame = dame_vide
    dame.set_dame(1, 1)
    assert_equal "impossible d'insérée une dame à cette endroit !", dame.set_dame(2, 2)
  end

end
