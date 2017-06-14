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

  it 'can translate a row and column to grid index' do
    g = SudokuTools::Grid.new(easy_grid)
    expecte(g.translate(0,0)).to eq 0
    expecte(g.translate(8,8)).to eq 80
  end
end
