class SudokuTools::Grid
  def initialize(serialized_grid)
    @grid = serialized_grid
    @rows = parse_rows
    @columns = parse_columns
    @boxes = parse_boxes
    @candidates = initialize_candidates
    prune_candidates
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

  def translate(row, col)
    (row * 9) + col
  end

  def add_candidate(row, col, val)
  end

  def remove_candidate(row, col, val)
  end

  def mark_cell(row, col, val)
    index = translate(row, col)
    @grid[index] = val
  end

  def clear_cell(row, col, val)
    index = translate(row, col)
    @grid[index] = "0"
  end

  private

  def initialize_candidates

  end

  def prune_candidates

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
