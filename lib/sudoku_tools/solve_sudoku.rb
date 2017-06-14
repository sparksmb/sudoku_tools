require "sudoku_tools/grid"

class SudokuTools::SolveSudoku
  def initialize(serialized_grid)
    @grid = SudokuTools::Grid.new(serialized_grid)
  end

  def execute
    begin
    end while contrains_applied?
    @grid
  end

  private

  def contrains_applied?
    false
  end
end
