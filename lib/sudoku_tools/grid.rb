require_relative 'grid_index_coordinate_conversion'

class SudokuTools::Grid
  include SudokuTools::GridIndexCoordinateConversion

  def initialize(serialized_grid)
    @grid = serialized_grid
    initialize_candidates
  end

  def serialized
    @grid
  end

  def candidates
    @candidates
  end

  def row(n)
    i = row_to_index(n)
    @grid[i..i+8]
  end

  def column(c)
    column = ""
    (0..8).each {|r|
      index = coordinate_to_index(r,c)
      column << @grid[index]
    }
    column
  end

  def prune_candidates
    prune_candidates_from_rows
    #prune_candidates_from_columns
    #prune_candidates_from_boxes
  end

  def prune_row(row)
    ri = row_to_index(row)
    offset = ri + 8
    @grid[ri..offset].tr('0','').split("").each do |digit|
      (ri..offset).each { |c| @candidates[c] = @candidates[c].tr(digit, '') }
    end
  end

  def prune_candidates_from_rows
    (0..8).each {|row| prune_row(row) }
    #@grid.split("").each_with_index do |char, index|
    #  if char != "0"
    #    ap coordinate = index_to_coordinate(index)
    #    prune_row(coordinate[:row])
    #  end
    #end
  end

  def prune_column(column)
    digits = column(column).tr('0','').split('')
    (0..8).each {|row|
      index = coordinate_to_index(row, column)
      digit = @grid[index]
      if digit == '0'
        ap digits
        digits.each {|d|
          ap d
          @candidates[index] = @candidates[index].tr(d, '') }
      end
    }
    #(0..8).each {|row|
    #  ap index = coordinate_to_index(row, column)
    #  ap digit = @grid[index]
    #  if digit == '0'
    #    ap @candidates[index]
    #    @candidates[index] = @candidates[index].tr(digit, '')
    #    ap @candidates[index]
    #  end
    #}
  end

  def prune_candidates_from_columns
  end

  #def prune_candidates_from_boxes
  #end

  def prune_candidates_where_digit
    @grid.split("").each_with_index do |char, index|
      @candidates[index] = "" if char != "0"
    end
  end

  private

  def initialize_candidates
    path = 'spec/fixtures/candidates.json'
    @candidates = JSON.parse(File.open(path).read)
    prune_candidates_where_digit
    #prune_candidates_from_rows
  end
end
