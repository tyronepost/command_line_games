require_relative '../../general/pair'

class WinDetector

  def imminent_win_for_self(interface, symbol)
    if pair = imminent_row_for_self(interface, 1, symbol)
    elsif pair = imminent_row_for_self(interface, 2, symbol)
    elsif pair = imminent_row_for_self(interface, 3, symbol)
    elsif pair = imminent_column_for_self(interface, 1, symbol)
    elsif pair = imminent_column_for_self(interface, 2, symbol)
    elsif pair = imminent_column_for_self(interface, 3, symbol)
    elsif pair = imminent_diagonal_for_self(interface, symbol)
    end
    pair
  end

  def imminent_win(interface)
    if pair = imminent_row(interface, 1)
    elsif pair = imminent_row(interface, 2)
    elsif pair = imminent_row(interface, 3)
    elsif pair = imminent_column(interface, 1)
    elsif pair = imminent_column(interface, 2)
    elsif pair = imminent_column(interface, 3)
    elsif pair = imminent_diagonal(interface)
    end
    pair
  end

  private
  def imminent_row_for_self(interface, row, symbol)
    if row_for_self(interface, row, 1, 2, 3, symbol)
      Pair.new(row, 3)
    elsif row_for_self(interface, row, 1, 3, 2, symbol)
      Pair.new(row, 2)
    elsif row_for_self(interface, row, 2, 3, 1, symbol)
      Pair.new(row, 1)
    end
  end

  def imminent_row(interface, row)
    if row(interface, row, 1, 2, 3)
      Pair.new(row, 3)
    elsif row(interface, row, 1, 3, 2)
      Pair.new(row, 2)
    elsif row(interface, row, 2, 3, 1)
      Pair.new(row, 1)
    end
  end

  def row_for_self(interface, row, filled_1, filled_2, empty, symbol)
    interface.get(row, filled_1) == symbol &&
    interface.get(row, filled_1) == interface.get(row, filled_2) &&
    !interface.set?(row, empty)
  end

  def row(interface, row, filled_1, filled_2, empty)
    interface.set?(row, filled_1) &&
    interface.get(row, filled_1) == interface.get(row, filled_2) &&
    !interface.set?(row, empty)
  end

  def imminent_column_for_self(interface, column, symbol)
    if column_for_self(interface, column, 1, 2, 3, symbol)
      Pair.new(3, column)
    elsif column_for_self(interface, column, 1, 3, 2, symbol)
      Pair.new(2, column)
    elsif column_for_self(interface, column, 2, 3, 1, symbol)
      Pair.new(1, column)
    end
  end

  def imminent_column(interface, column)
    if column(interface, column, 1, 2, 3)
      Pair.new(3, column)
    elsif column(interface, column, 1, 3, 2)
      Pair.new(2, column)
    elsif column(interface, column, 2, 3, 1)
      Pair.new(1, column)
    end
  end

  def column_for_self(interface, column, filled_1, filled_2, empty, symbol)
    interface.get(filled_1, column) == symbol &&
    interface.get(filled_1, column) == interface.get(filled_2, column) &&
    !interface.set?(empty, column)
  end

  def column(interface, column, filled_1, filled_2, empty)
    interface.set?(filled_1, column) &&
    interface.get(filled_1, column) == interface.get(filled_2, column) &&
    !interface.set?(empty, column)
  end

  def imminent_diagonal_for_self(interface, symbol)
    if interface.get(2, 2) == symbol && interface.get(2, 2) == interface.get(1, 1) && !interface.set?(3, 3)
      Pair.new(3, 3)
    elsif interface.get(2, 2) == symbol && interface.get(2, 2) == interface.get(3, 3) && !interface.set?(1, 1)
      Pair.new(1, 1)
    elsif interface.get(1, 1) == symbol && interface.get(1, 1) == interface.get(3, 3) && !interface.set?(2, 2)
      Pair.new(2, 2)
    elsif interface.get(2, 2) == symbol && interface.get(2, 2) == interface.get(3, 1) && !interface.set?(1, 3)
      Pair.new(1, 3)
    elsif interface.get(2, 2) == symbol && interface.get(2, 2) == interface.get(1, 3) && !interface.set?(3, 1)
      Pair.new(3, 1)
    elsif interface.get(1, 3) == symbol && interface.get(1, 3) == interface.get(3, 1) && !interface.set?(2, 2)
      Pair.new(2, 2)
    end
  end

  def imminent_diagonal(interface)
    if interface.set?(2, 2) && interface.get(2, 2) == interface.get(1, 1) && !interface.set?(3, 3)
      Pair.new(3, 3)
    elsif interface.set?(2, 2) && interface.get(2, 2) == interface.get(3, 3) && !interface.set?(1, 1)
      Pair.new(1, 1)
    elsif interface.set?(1, 1) && interface.get(1, 1) == interface.get(3, 3) && !interface.set?(2, 2)
      Pair.new(2, 2)
    elsif interface.set?(2, 2) && interface.get(2, 2) == interface.get(3, 1) && !interface.set?(1, 3)
      Pair.new(1, 3)
    elsif interface.set?(2, 2) && interface.get(2, 2) == interface.get(1, 3) && !interface.set?(3, 1)
      Pair.new(3, 1)
    elsif interface.set?(1, 3) && interface.get(1, 3) == interface.get(3, 1) && !interface.set?(2, 2)
      Pair.new(2, 2)
    end
  end
end