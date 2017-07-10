require 'spec_helper'

describe SudokuTools::SolveNakedSingles do
  before(:each) do
    @grid = SudokuTools::Grid.new(easy_grid)
    @grid.initialize_candidates
    @tactic = SudokuTools::SolveNakedSingles.new(@grid)
  end

  it 'should instantiate solve naked singles tactic' do
    expect(@tactic.class.to_s).to eq "SudokuTools::SolveNakedSingles"
  end

  it 'should successfully solve naked singles' do
    expect(@grid.serialized[0]).to eq '0'
    expect(@grid.serialized[7]).to eq '0'
    expect(@grid.serialized[12]).to eq '0'
    expect(@grid.serialized[20]).to eq '0'
    expect(@grid.serialized[28]).to eq '0'
    expect(@grid.serialized[68]).to eq '0'
    expect(@grid.serialized[73]).to eq '0'
    expect(@grid.serialized[80]).to eq '0'
    grid = @tactic.execute
    expect(grid.serialized[0]).to eq '6'
    expect(grid.serialized[7]).to eq '8'
    expect(grid.serialized[12]).to eq '3'
    expect(grid.serialized[20]).to eq '5'
    expect(grid.serialized[28]).to eq '4'
    expect(grid.serialized[68]).to eq '8'
    expect(grid.serialized[73]).to eq '1'
    expect(grid.serialized[80]).to eq '5'
  end
end

