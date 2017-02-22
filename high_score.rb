require 'csv'
require 'terminal-table'

class HighScore

  attr_accessor :name

  def initialize
    @name = {}
  end

  def save(filename, player, score)
    CSV.open(filename, "ab") do |csv|
      csv << [player, score]
    end
  end

  def read(filenames)
    CSV.foreach(filenames) do |row|
      @name [row[0]] = row[1]
    end

    display
  end

  def display
    #read(filename)
    rows = []
    rows = @name.sort_by {|_key, value| value}.reverse
    table = Terminal::Table.new :title => "High Scores", :headings => ['Players', 'Score'], :rows => rows[0..4]
    puts table
  end


end
