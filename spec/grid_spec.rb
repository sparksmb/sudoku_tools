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

  it 'should return grid column digits' do
    expect(@grid.column(0)).to eq "010532498"
    expect(@grid.column(5)).to eq "079316000"
  end

  it 'should prune a column' do
    @grid.prune_digits
    @grid.prune_column(0)
    #[0,9,18,27,36,45,54,63,72].each {|ci| ap @grid.candidates[ci] }
    [9,27,36,45,54,63,72].each {|ci| expect(@grid.candidates[ci]).to eq "" }
    [0,18].each {|ci| expect(@grid.candidates[ci]).to eq "67" }

    @grid.prune_column(5)
    #[5,14,23,32,41,50,59,68,77].each {|ci| ap @grid.candidates[ci] }
    [14,23,32,41,50].each {|ci| expect(@grid.candidates[ci]).to eq "" }
    [5,59,68,77].each {|ci| expect(@grid.candidates[ci]).to eq "2458" }
  end

  it 'should return grid box digits' do
    expect(@grid.box(0)).to eq "090102030"
    expect(@grid.box(4)).to eq "723491856"
    expect(@grid.box(8)).to eq "030401020"
  end

  it 'should prune a box' do
    @grid.prune_digits
    @grid.prune_box(0)
    [0,2,10,18,20].each {|ci| expect(@grid.candidates[ci]).to eq "45678" }
    [1,9,11,19].each {|ci| expect(@grid.candidates[ci]).to eq "" }
  end

  it 'should prune candidates' do
    @grid.initialize_candidates
    expect(@grid.candidates).to eq easy_grid_candidates
  end
end
