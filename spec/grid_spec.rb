require 'spec_helper'

describe SudokuTools::Grid do
  it 'converts grid index to grid coordinate' do
    g = SudokuTools::Grid.new(easy_grid)
    expect(g.index_to_coordinate(0)).to eq ({ row: 0, column: 0 })
    expect(g.index_to_coordinate(28)).to eq ({ row: 3, column: 1 })
    expect(g.index_to_coordinate(40)).to eq ({ row: 4, column: 4 })
    expect(g.index_to_coordinate(69)).to eq ({ row: 7, column: 6 })
    expect(g.index_to_coordinate(80)).to eq ({ row: 8, column: 8 })
  end

  it 'can convert a grid coordinate to index' do
    g = SudokuTools::Grid.new(easy_grid)
    expect(g.coordinate_to_index(0,0)).to eq 0
    expect(g.coordinate_to_index(8,8)).to eq 80
  end

  it 'has pruned candidates' do
    g = SudokuTools::Grid.new(easy_grid)
    #ap g.serialized
    g.prune_candidates_where_digit
    #ap g.candidates
    expect(g.candidates).to eq easy_grid_candidates_pruned_by_digit
    expect(g.candidates).to eq easy_grid_candidates
  end
end
