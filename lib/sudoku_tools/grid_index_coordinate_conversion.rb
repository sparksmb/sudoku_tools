module SudokuTools::GridIndexCoordinateConversion
  def index_to_row(index)
    index / 9
  end

  def index_to_column(index)
    index - (index_to_row(index) * 9)
  end

  def index_to_box(index)
    coord = index_to_coordinate(index)
    if coord[:row] <= 2
      if coord[:column] <= 2
        return 0
      elsif coord[:column] <= 5
        return 1
      else
        return 2
      end
    elsif coord[:row] >= 3 and coord[:row] <= 5
      if coord[:column] <= 2
        return 3
      elsif coord[:column] <= 5
        return 4
      else
        return 5
      end
    else
      if coord[:column] <= 2
        return 6
      elsif coord[:column] <= 5
        return 7
      else
        return 8
      end
    end
  end

  def row_to_index(row)
    row * 9
  end

  def index_to_coordinate(index)
    { row: index_to_row(index), column: index_to_column(index) }
  end

  def coordinate_to_index(row, column)
    row_to_index(row) + column
  end
end
