require 'spec_helper'

describe SudokuTools::PrintGrid do
  it 'should print grid to console' do
    pr = SudokuTools::PrintGrid.new(SudokuTools::Grid.new(easy_grid))
    expect(pr.execute).to eq(File.open('spec/fixtures/print_easy_grid.txt').read)
  end

  it 'should print grid candidates to console' do
    grid = SudokuTools::Grid.new(easy_grid)
    grid.initialize_candidates
    pr = SudokuTools::PrintGrid.new(grid)

    actual = pr.execute(:candidates)
    expected = File.open('spec/fixtures/print_easy_grid_candidates.txt').read
    expect(actual).to eq(expected)
  end
end

