module SudokuTools
  class SolveNakedSingles
    def initialize(grid)
      @grid = grid
      @failed = true
    end

    def execute
      @grid.candidates.each_with_index {|candidates, index|
        if candidates.length == 1
          @failed = false
          digit = @grid.candidates[index]
          @grid.candidates[index] = ""
          @grid.cell(index, digit)
        end
      }
      @grid
    end

    def failed?
      @failed
    end
  end
end
