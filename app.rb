require_relative 'lib/scrapper'
require_relative 'lib/json_saver'
require_relative 'lib/spreadsheet_saver'
require_relative 'lib/csv_saver'

scrapper = Scrapper.new
townhall_emails = scrapper.get_townhall_emails

JsonSaver.save_as_json(townhall_emails, 'emails.JSON')
SpreadsheetSaver.save_as_spreadsheet(townhall_emails, 'mairies.csv')
CsvSaver.save_as_csv(townhall_emails, 'mairies.csv')

townhall_emails.each do |townhall|
  townhall.each do |name, email|
    puts "{ \"#{name}\" => \"#{email}\" },"
  end
end
