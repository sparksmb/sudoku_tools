require 'spec_helper'

describe SudokuTools::SolveSudoku do
  it 'should solve easy grid' do
    grid = SudokuTools::SolveSudoku.new(easy_grid).execute
    expect(grid.serialized).to eq easy_grid_solved
  end
end
