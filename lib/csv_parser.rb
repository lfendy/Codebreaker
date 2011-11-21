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
        :skills_attributes => parse_skills(row[4])
      }
    end
  end

  def self.parse_skills string
    string ||= ""
    string.split("|").collect do |skill|
      {:name => skill}
    end
  end
end
