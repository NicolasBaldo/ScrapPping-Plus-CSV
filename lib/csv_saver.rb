require 'csv'

class CsvSaver
  def self.save_as_csv(data, file_path)
    return if data.nil?

    CSV.open(file_path, 'w') do |csv|
      data.each { |city, email| csv << [city, email] }
    end
  end
end

