module ServerLogParser
  class CustomError < StandardError; end

  class ReadFile
    def initialize(file_path)
      @file_path = file_path
    end

    def lines
      read_file.each.lazy.map(&:chomp)
    end

    private

    def read_file
      begin
        File.open(@file_path, "r")
      rescue Errno::ENOENT, Errno::EACCESS => e
        raise ServerLogParser::CustomError, e.message
      end
    end
  end

  
end
