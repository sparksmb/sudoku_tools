module SudokuTools
  class SolveHiddenSingles
    include SudokuTools::GridIndexCoordinateConversion

    def initialize(grid)
      @grid = grid
      @failed = true
    end

    def execute
      solve_hidden_singles_across_rows
      solve_hidden_singles_across_columns
      #solve_hidden_singles_across_boxes
      @grid
    end

    def failed?
      @failed
    end

    def solve_hidden_singles_across_rows
      (0..8).each {|row|
        solve_row(row)
      }
    end

    def solve_row(row)
      index = @grid.row_to_index(row)
      candidates_array = @grid.candidates[index..index+8]
      row_candidates = candidates_array.join('')
      (1..9).each {|d|
        digit = d.to_s
        if row_candidates.count(digit) == 1
          @failed = false
          column = candidates_array.index {|cell| cell.include?(digit) }
          index = coordinate_to_index(row, column)
          #ap "**************** row: #{row} col: #{column} digit: #{digit} ******************"
          @grid.candidates[index].tr!(digit, '')
          @grid.cell(index, digit)
        end
      }
    end

    def solve_hidden_singles_across_columns
      (0..8).each {|col|
        solve_column(col)
      }
    end

    def solve_column(col)
      indicies = column_indicies(col)
      candidates_array = indicies.map {|i| @grid.candidates[i] }
      candidates = candidates_array.join('')
      (1..9).each {|d|
        digit = d.to_s
        if candidates.count(digit) == 1
          @failed = false
          candidates_array_index = candidates_array.index {|cell|
            cell.include?(digit)
          }
          index = indicies[candidates_array_index]
          @grid.candidates[index].tr!(digit, '')
          @grid.cell(index, digit)
        end
      }
    end

    def solve_hidden_singles_across_boxes
    end
  end
end

