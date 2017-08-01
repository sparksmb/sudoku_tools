require 'spec_helper'

describe SudokuTools::GridIndexCoordinateConversion do
  include SudokuTools::GridIndexCoordinateConversion

  it 'converts grid index to row' do
    expect(index_to_row(0)).to eq 0
    expect(index_to_row(39)).to eq 4
    expect(index_to_row(69)).to eq 7
    expect(index_to_row(80)).to eq 8
  end

  it 'converts grid index to column' do
    expect(index_to_column(0)).to eq 0
    expect(index_to_column(39)).to eq 3
    expect(index_to_column(69)).to eq 6
    expect(index_to_column(80)).to eq 8
  end

  it 'converts grid index to box' do
    expect(index_to_box(0)).to eq 0
    expect(index_to_box(17)).to eq 2
    expect(index_to_box(40)).to eq 4
    expect(index_to_box(80)).to eq 8
  end

  it 'converts row to grid index' do
    expect(row_to_index(0)).to eq 0
    expect(row_to_index(1)).to eq 9
    expect(row_to_index(4)).to eq 36
    expect(row_to_index(8)).to eq 72
  end

  it 'converts grid index to grid coordinate' do
    expect(index_to_coordinate(0)).to eq ({ row: 0, column: 0 })
    expect(index_to_coordinate(28)).to eq ({ row: 3, column: 1 })
    expect(index_to_coordinate(40)).to eq ({ row: 4, column: 4 })
    expect(index_to_coordinate(69)).to eq ({ row: 7, column: 6 })
    expect(index_to_coordinate(80)).to eq ({ row: 8, column: 8 })
  end

  it 'can convert a grid coordinate to index' do
    expect(coordinate_to_index(0,0)).to eq 0
    expect(coordinate_to_index(4,1)).to eq 37
    expect(coordinate_to_index(8,8)).to eq 80
  end

  it 'can get an array of box indicies' do
    expect(box_indicies(4)).to eq ([30,31,32,39,40,41,48,49,50])
  end

  it 'can get an array of column indicies' do
    expect(column_indicies(0)).to eq ([0,9,18,27,36,45,54,63,72])
    expect(column_indicies(2)).to eq ([2,11,20,29,38,47,56,65,74])
  end
end
