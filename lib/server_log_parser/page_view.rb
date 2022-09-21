module ServerLogParser
  Line = Struct.new(:visit_path, :ip_addr)
  class PageView
    def initialize(records)
      @records = records
    end

    def records
      @records.lazy.map { |line| Line.new(*line.split)}
    end
  end
end
