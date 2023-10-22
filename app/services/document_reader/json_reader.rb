module DocumentReader
  class JsonReader < DocumentReaderInterface
    require 'json'

    def read(file_path)
      file_content = File.read(file_path)
      JSON.parse(file_content)
    end
  end
end
