require 'spec_helper'

describe SudokuTools::PrintGrid do
  it 'should print grid to console' do
    pr = SudokuTools::PrintGrid.new(SudokuTools::Grid.new(easy_grid))
    expect(pr.execute).to eq(File.open('spec/fixtures/easy_grid.txt').read)
  end
end

