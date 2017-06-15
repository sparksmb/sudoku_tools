require 'spec_helper'

describe SudokuTools::Grid do
  it 'has rows' do
    rows = ["090000307",
            "102007569",
            "030089214",
            "501723006",
            "368491752",
            "200856103",
            "427160030",
            "956200401",
            "803000020"]
    expect(SudokuTools::Grid.new(easy_grid).rows).to eq(rows)
  end

  it 'has columns' do
    columns= ["010532498",
              "903060250",
              "020180763",
              "000748120",
              "008295600",
              "079316000",
              "352071040",
              "061050302",
              "794623010"]
    expect(SudokuTools::Grid.new(easy_grid).columns).to eq(columns)
  end

  it 'has boxes' do
    boxes = ["090102030",
             "000007089",
             "307569214",
             "501368200",
             "723491856",
             "006752103",
             "427956803",
             "160200000",
             "030401020"]
    expect(SudokuTools::Grid.new(easy_grid).boxes).to eq(boxes)
  end

  it 'converts grid index to grid coordinate' do
    g = SudokuTools::Grid.new(easy_grid)
    expect(g.index_to_coordinate(0)).to eq ({ row: 0, column: 0 })
    expect(g.index_to_coordinate(28)).to eq ({ row: 3, column: 1 })
    expect(g.index_to_coordinate(40)).to eq ({ row: 4, column: 4 })
    expect(g.index_to_coordinate(69)).to eq ({ row: 7, column: 6 })
    expect(g.index_to_coordinate(80)).to eq ({ row: 8, column: 8 })
  end

  it 'has candidates' do
    g = SudokuTools::Grid.new(easy_grid)
    ap g.serialized
    ap candidates = g.candidates
    expect(candidates).to eq easy_grid_candidates
  end

  it 'can translate a row and column to grid index' do
    g = SudokuTools::Grid.new(easy_grid)
    expect(g.coordinate_to_index(0,0)).to eq 0
    expect(g.coordinate_to_index(8,8)).to eq 80
  end
end
