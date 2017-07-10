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
    @run_count += 1

    tactic = SudokuTools::SolveNakedSingles.new(@grid)
    @grid = tactic.execute
    @grid.prune_candidates

    @failed |= tactic.failed?
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
