require_relative 'grid_index_coordinate_conversion'

class SudokuTools::Grid
  include SudokuTools::GridIndexCoordinateConversion

  def initialize(serialized_grid)
    @grid = serialized_grid
    path = 'spec/fixtures/candidates.json'
    @candidates = JSON.parse(File.open(path).read)
  end

  def serialized
    @grid
  end

  def candidates
    @candidates
  end

  def row(r)
    i = row_to_index(r)
    @grid[i..i+8]
  end

  def column(c)
    column = ""
    (0..8).each {|r|
      index = coordinate_to_index(r,c)
      column << @grid[index]
    }
    column
  end

  def box(b)
    box_indicies(b).map{|i|@grid[i]}.join('')
  end

  def prune_candidates
    prune_rows
    prune_columns
    prune_boxes
  end

  def prune_row(row)
    ri = row_to_index(row)
    offset = ri + 8
    @grid[ri..offset].tr('0','').split("").each do |digit|
      (ri..offset).each { |c| @candidates[c] = @candidates[c].tr(digit, '') }
    end
  end

  def prune_rows
    (0..8).each {|row| prune_row(row) }
  end

  def prune_column(column)
    digits = column(column).tr('0','').split('')
    (0..8).each {|row|
      index = coordinate_to_index(row, column)
      digit = @grid[index]
      if digit == '0'
        digits.each {|d| @candidates[index] = @candidates[index].tr(d, '') }
      end
    }
  end

  def prune_columns
    (0..8).each {|column| prune_column(column) }
  end

  def prune_box(box)
    digits = box(box).tr('0','').split('')
    box_indicies(box).each{ |index|
      digit = @grid[index]
      if digit == '0'
        digits.each {|d| @candidates[index] = @candidates[index].tr(d, '') }
      end
    }
  end

  def prune_boxes
    (0..8).each {|box| prune_box(box) }
  end

  def prune_digits
    @grid.split("").each_with_index do |char, index|
      @candidates[index] = "" if char != "0"
    end
  end

  def initialize_candidates
    prune_digits
    prune_candidates
  end
end
