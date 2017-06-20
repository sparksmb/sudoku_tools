#include SudokuTools::GridIndexCoordinateConversion

class SudokuTools::Grid

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
    offset = ri + 9
    @grid[ri..offset].tr('0','').split("").each do |digit|
      (ri..offset).each { |c| @candidates[c] = @candidates[c].tr(digit, '') }
    end
  end

  def prune_candidates_from_rows
    @grid.split("").each_with_index do |char, index|
      if char != "0"
        coordinate = coordinate_to_index(index)
        prune_row(coordinate[:row], char)
      end
    end
  end

  #def prune_candidates_from_columns
  #end

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
  end
end
