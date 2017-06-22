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
    (0..8).each {|row|

    }
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
