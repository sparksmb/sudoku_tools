class SudokuTools::PrintGrid
  def initialize(grid)
    @grid = grid
  end

  def execute(options=nil)
    if options and options == :candidates
      return print_candidates
    end
    print_loop(@grid.serialized)
  end

  private

  def print(g)
    "#{g[0..2]}|#{g[3..5]}|#{g[6..8]}\n" +
    "#{g[9..11]}|#{g[12..14]}|#{g[15..17]}\n" +
    "#{g[18..20]}|#{g[21..23]}|#{g[24..26]}\n" +
    "---+---+---\n" +
    "#{g[27..29]}|#{g[30..32]}|#{g[33..35]}\n" +
    "#{g[36..38]}|#{g[39..41]}|#{g[42..44]}\n" +
    "#{g[45..47]}|#{g[48..50]}|#{g[51..53]}\n" +
    "---+---+---\n" +
    "#{g[54..56]}|#{g[57..59]}|#{g[60..62]}\n" +
    "#{g[63..65]}|#{g[66..68]}|#{g[69..71]}\n" +
    "#{g[72..74]}|#{g[75..77]}|#{g[78..80]}\n"
  end

  def print_loop(g)
    format = ""
    (0..8).each do |row|
      (0..8).each do |column|
        index = (9 * row) + column
        if g[index] == "0"
          format += " "
        else
          format += g[index]
        end
        format += "|" if column == 2 or column == 5
        format += "\n" if column == 8
      end
      format += "---+---+---\n" if row == 2 or row == 5
    end
    format
  end

  def print_candidates
    format = ""
    (0..8).each do |row|
      (0..8).each do |column|
        index = (9 * row) + column
        candidates = @grid.candidates[index]
        cell = candidates.rjust(9, ' ')
        cell = "_".rjust(9, ' ') if candidates == ''
        format += "#{cell} "
        format += "|" if column == 2 or column == 5
        format += "\n" if column == 8
      end
      format += "------------------------------+------------------------------+------------------------------\n" if row == 2 or row == 5
    end
    format
  end
end
