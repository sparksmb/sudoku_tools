require 'spec_helper'

describe SudokuTools::Grid do
  before(:each) do
    @grid = SudokuTools::Grid.new(easy_grid)
  end

  it 'has pruned candidates' do
    @grid.prune_candidates_where_digit
    expect(@grid.candidates).to eq easy_grid_candidates_pruned_by_digit
    #expect(@grid.candidates).to eq easy_grid_candidates
  end

  it 'should prune a row' do
    ap @grid.serialized
    ap @grid.candidates.first(9)
    @grid.prune_row(0)
    ap @grid.candidates.first(9)
    #ap @grid.candidates.first.tr('1', '')
    #ap @grid.candidates.first
    #expect(@grid.candidates.first[0]).to eq ("12345678")
  end
end
