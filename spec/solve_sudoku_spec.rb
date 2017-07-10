require 'spec_helper'

describe SudokuTools::SolveSudoku do
  it 'should instantiate a sudoku solver' do
    grid = SudokuTools::Grid.new(easy_grid)
    solver = SudokuTools::SolveSudoku.new(grid)
    expect(solver.class.to_s).to eq 'SudokuTools::SolveSudoku'
  end

  it 'should solve easy grid' do
    grid = SudokuTools::Grid.new(easy_grid)
    solver = SudokuTools::SolveSudoku.new(grid)
    expect(solver.execute.serialized).to eq easy_grid_solved
  end

  it 'should solve simple grid' do
    grid = SudokuTools::Grid.new(simple_grid)
    solver = SudokuTools::SolveSudoku.new(grid)
    expect(solver.execute.serialized).to eq simple_grid_solved
  end

  it 'should solve moderate grid' do
    grid = SudokuTools::Grid.new(moderate_grid)
    solver = SudokuTools::SolveSudoku.new(grid)
    grid = solver.execute
    pr = SudokuTools::PrintGrid.new(grid)
    puts pr.execute
    puts pr.execute(:candidates)
  end
end
