class SudokuTools::SolveSudoku
  def initialize#(grid)
    #@grid = grid
    @count = 0
  end

  def execute
    begin
    end while contrains_applied?
  end

  private

  def contrains_applied?
    puts @count
    @count < 4
  end
end
