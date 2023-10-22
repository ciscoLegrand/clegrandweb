module DocumentReader
  class DocumentReaderInterface
    def read(file_path)
      raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
    end
  end
end
