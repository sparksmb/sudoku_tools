require 'spec_helper'

describe SudokuTools::Grid do
  before(:each) do
    @grid = SudokuTools::Grid.new(easy_grid)
  end

  it 'should return grid row digits' do
    expect(@grid.row(0)).to eq "090000307"
    expect(@grid.row(4)).to eq "368491752"
    expect(@grid.row(8)).to eq "803000020"
  end

  it 'should prune a row' do
    @grid.prune_row(0)
    expect(@grid.candidates[0]).to eq ("124568")

    @grid.prune_row(4)
    (36..44).each {|ci| expect(@grid.candidates[ci]).to eq ("") }

    @grid.prune_row(6)
    #(54..62).each {|ci| ap @grid.candidates[ci] }
    expect(@grid.candidates[59]).to eq ("589")
  end

  it 'should prune all rows' do
    @grid.prune_candidates_from_rows
    ap @grid.candidates
  end

  it 'should return a column of digits' do
    expect(@grid.column(0)).to eq "010532498"
    expect(@grid.column(5)).to eq "079316000"
  end

  it 'should prune a column' do
    @grid.prune_column(0)
    expect(@grid.candidates[0]).to eq ("67")
    expect(@grid.candidates[1]).to eq ("")
    expect(@grid.candidates[2]).to eq ("67")
  end

  it 'has pruned candidates' do
    @grid.prune_candidates_where_digit
    expect(@grid.candidates).to eq easy_grid_candidates_pruned_by_digit
    expect(@grid.candidates).to eq easy_grid_candidates
  end
end
