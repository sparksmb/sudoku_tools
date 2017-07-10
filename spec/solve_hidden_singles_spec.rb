require 'spec_helper'

describe SudokuTools::SolveHiddenSingles do
  before(:each) do
    @grid = SudokuTools::Grid.new(moderate_grid)
    @grid.initialize_candidates
    @tactic = SudokuTools::SolveHiddenSingles.new(@grid)
  end

  it 'should instantiate solve hidden singles tactic' do
    expect(@tactic.class.to_s).to eq "SudokuTools::SolveHiddenSingles"
  end

  it 'should successfully solve hidden singles in row 0' do
    setup_grid_state
    #puts SudokuTools::PrintGrid.new(@grid).execute(:candidates)
    @tactic.solve_row(0)
    expect(@grid.serialized[0..8]).to eq "010005408"
    #ap "==========="
    #puts SudokuTools::PrintGrid.new(@grid).execute(:candidates)
  end

  def setup_grid_state
    state = JSON.parse(File.open('spec/fixtures/moderate_grid_state1.txt').read)
    @grid.serialized(state["grid"])
    @grid.candidates(state["candidates"])
  end
end
