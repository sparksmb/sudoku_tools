class SudokuTools::Grid
  def initialize(serialized_grid)
    @grid = serialized_grid
    @rows = parse_rows
    @columns = parse_columns
    @boxes = parse_boxes
    initialize_candidates
  end

  def serialized
    @grid
  end

  def rows
    @rows
  end

  def columns
    @columns
  end

  def boxes
    @boxes
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

  private

  def initialize_candidates
    path = 'spec/fixtures/candidates.json'
    ap @candidates = JSON.parse(File.open(path).read)
    prune_candidates_where_digit
    prune_candidates_from_rows
    prune_candidates_from_columns
  end

  def prune_candidates_from_rows
  end

  def prune_candidates_from_columns
  end

  def prune_candidates_where_digit
    @grid.split("").each_with_index do |char, index|
      if char != "0"
        coordinate = index_to_coordinate(index)
        @candidates[coordinate[:row]][coordinate[:column]] = ""
      end
    end
  end

  def parse_rows
    rows = []
    (0..8).each do |row|
      index = (9 * row)
      rows << @grid[index..index+8]
    end
    rows
  end

  def parse_columns
    columns = ["","","","","","","","",""]
    (0..8).each do |row|
      index = (9 * row)
      (0..8).each do |column|
        columns[column] += @grid[index + column]
      end
    end

    columns
  end

  def parse_boxes
    boxes = []
    box_a = ""; box_b = ""; box_c = ""
    (0..8).each do |row|
      index = (9 * row)
      box_a += @grid[index..index+2]
      box_b += @grid[index+3..index+5]
      box_c += @grid[index+6..index+8]
      if row == 2 or row == 5
        boxes << box_a; boxes << box_b; boxes << box_c
        box_a = ""; box_b = ""; box_c = ""
      end
    end
    boxes << box_a; boxes << box_b; boxes << box_c
    box_a = ""; box_b = ""; box_c = ""

    boxes
  end
end
