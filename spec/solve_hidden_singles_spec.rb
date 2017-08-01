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

  it 'should successfully solve hidden singles in row' do
    setup_grid_state
    puts SudokuTools::PrintGrid.new(@grid).execute(:candidates)
    puts
    puts SudokuTools::PrintGrid.new(@grid).execute
    puts
    puts "-------------------------------"
    @tactic.solve_row(0)
    expect(@grid.row(0)).to eq "010005408"
    @tactic.solve_row(1)
    expect(@grid.row(1)).to eq "030400529"
    @tactic.solve_row(2)
    expect(@grid.row(2)).to eq "495280170"
    @tactic.solve_row(3)
    expect(@grid.row(3)).to eq "070604000"
    @tactic.solve_row(4)
    expect(@grid.row(4)).to eq "361852947"
    @tactic.solve_row(5)
    expect(@grid.row(5)).to eq "054307080"
    @tactic.solve_row(6)
    expect(@grid.row(6)).to eq "683040752"
    @tactic.solve_row(7)
    expect(@grid.row(7)).to eq "529008000"
    @tactic.solve_row(8)
    expect(@grid.row(8)).to eq "147520890"
  end

  it 'should successfully solve all rows' do
    setup_grid_state
    puts SudokuTools::PrintGrid.new(@grid).execute(:candidates)
    puts
    puts SudokuTools::PrintGrid.new(@grid).execute
    puts
    puts "-------------------------------"
    @tactic.solve_hidden_singles_across_rows
    @grid.prune_candidates
    state = JSON.parse(File.open('spec/fixtures/moderate_grid_state2.txt').read)
    expect(@grid.serialized).to eq state["grid"]
    expect(@grid.candidates).to eq state["candidates"]
    puts SudokuTools::PrintGrid.new(@grid).execute(:candidates)
    puts
    puts SudokuTools::PrintGrid.new(@grid).execute
    puts
    puts "-------------------------------"
  end

  it 'should successfully solve hidden singles in a column' do
    setup_grid_state
    @tactic.solve_hidden_singles_across_rows
    puts SudokuTools::PrintGrid.new(@grid).execute(:candidates)
    puts
    puts SudokuTools::PrintGrid.new(@grid).execute
    puts
    puts "-------------------------------"
    @tactic.solve_column(2)
    expect(@grid.column(2)).to eq "005014397"
    @tactic.solve_column(4)
    expect(@grid.column(4)).to eq "000050002"
    puts SudokuTools::PrintGrid.new(@grid).execute(:candidates)
    puts
    puts SudokuTools::PrintGrid.new(@grid).execute
    puts
    puts "-------------------------------"
  end

  it 'should successfully solve hidden singles across all columns' do
    setup_grid_state
    @tactic.solve_hidden_singles_across_rows
    puts SudokuTools::PrintGrid.new(@grid).execute(:candidates)
    puts SudokuTools::PrintGrid.new(@grid).execute
    @tactic.solve_hidden_singles_across_columns
    expect(@grid.column(2)).to eq "005014397"
    expect(@grid.column(4)).to eq "000050002"
  end

  it 'should solve moderate grid' do
    setup_grid_state
    puts SudokuTools::PrintGrid.new(@grid).execute(:candidates)
    puts
    puts SudokuTools::PrintGrid.new(@grid).execute
    puts
    puts "-------------------------------"
    puts
    @grid = @tactic.execute
    puts SudokuTools::PrintGrid.new(@grid).execute(:candidates)
    puts
    puts SudokuTools::PrintGrid.new(@grid).execute
    puts
    puts "-------------------------------"
    puts
  end

  def setup_grid_state
    state = JSON.parse(File.open('spec/fixtures/moderate_grid_state1.txt').read)
    @grid.serialized(state["grid"])
    @grid.candidates(state["candidates"])
  end
end
