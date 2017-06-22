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

  def box_indicies(box_number)
    indicies = [
      [0,1,2,9,10,11,18,19,20],
      [3,4,5,12,13,14,21,22,23],
      [6,7,8,15,16,17,24,25,26],
      [27,28,29,36,37,38,45,46,47],
      [30,31,32,39,40,41,48,49,50],
      [33,34,35,42,43,44,51,52,53],
      [54,55,56,63,64,65,72,73,74],
      [57,58,59,66,67,68,75,76,77],
      [60,61,62,69,70,71,78,79,80]
    ]
    indicies[box_number]
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
