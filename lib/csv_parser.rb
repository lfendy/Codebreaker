require 'csv'

class CSVParser
  def self.parse file
    parsed_file = CSV::parse(file)
    parsed_file.collect do |row|
      {
        :name => row[0],
        :role => row[1],
        :grade => row[2],
        :email => row[3],
        :skill => row[4]
      }
    end
  end
end
