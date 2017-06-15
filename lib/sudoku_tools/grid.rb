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

  def index_to_coordinate(index)
    row = index / 9
    { row: row, column: index - (row * 9) }
  end

  def coordinate_to_index(row, column)
    row * 9 + column
  end

  def prune_candidates_from_rows
    @grid.split("").each_with_index do |char, index|
      if char != "0"
        coordinate = coordinate_to_index(index)
      end
    end
  end

  def prune_candidates_from_columns
  end

  def prune_candidates_where_digit
    @grid.split("").each_with_index do |char, index|
      @candidates[index] = "" if char != "0"
    end
  end

  private

  def scan_grid
    @grid.split("").each_with_index do |char, index|
      yield
    end
  end

  def initialize_candidates
    path = 'spec/fixtures/candidates.json'
    @candidates = JSON.parse(File.open(path).read)
    prune_candidates_where_digit
    prune_candidates_from_rows
    prune_candidates_from_columns
  end
end
