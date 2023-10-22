module DocumentReader
  class DocumentInitializer
    def initialize(file_path)
      @file_path = file_path
      @service = choose_service
    end

    def read
      @service.read(@file_path)
    end

    private

    def choose_service
      case File.extname(@file_path)
      when '.json'
        JsonReader.new
      else
        raise "Unsupported file type"
      end
    end
  end
end
