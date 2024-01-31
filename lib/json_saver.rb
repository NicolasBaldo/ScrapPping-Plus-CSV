require 'json'

class JsonSaver
  def self.save_as_json(data, file_path)
    File.open(file_path, 'w') do |file|
      file.write(data.to_json)
    end
  end
end
