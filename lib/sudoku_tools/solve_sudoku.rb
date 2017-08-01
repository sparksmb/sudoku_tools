class SudokuTools::SolveSudoku
  def initialize(grid)
    @grid = grid
    @grid.initialize_candidates
    @failed = false
    @run_count = 0
  end

  def execute
    run_tactics until solved?
    @grid
  end

  def run_tactics
    ap @run_count += 1
    tactics = [
      SudokuTools::SolveNakedSingles.new(@grid),
      SudokuTools::SolveHiddenSingles.new(@grid)
    ]

    tactics.each {|tactic|
      @grid = tactic.execute
      @grid.prune_candidates
      @failed |= tactic.failed?
    }

    @failed
  end

  def solved?
    solved_all_digits or tactics_had_no_effect
  end

  def tactics_run_count
    @run_count
  end

  private

  def solved_all_digits
    not @grid.serialized.include? '0'
  end

  def tactics_had_no_effect
    @failed
  end
end
