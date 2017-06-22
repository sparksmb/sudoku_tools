require 'spec_helper'

describe SudokuTools::Grid do
  before(:each) do
    @grid = SudokuTools::Grid.new(easy_grid)
  end

  it 'should prune a row' do
    @grid.prune_row(0)
    expect(@grid.candidates.first).to eq ("24568")
  end

  it 'should prune all rows' do
    @grid.prune_candidates_from_rows
    ap @grid.candidates
  end

  it 'should prune a column' do
    index = coordinate_to_index(0,0)
    @grid.prune_column(index)
    expect(@grid.candidates.first).to eq ("67")
  end

  it 'has pruned candidates' do
    @grid.prune_candidates_where_digit
    expect(@grid.candidates).to eq easy_grid_candidates_pruned_by_digit
    expect(@grid.candidates).to eq easy_grid_candidates
  end
end
