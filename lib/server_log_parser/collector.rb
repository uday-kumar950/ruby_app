module ServerLogParser
  class Collector
    attr_accessor :total_count, :unique_count, :ip_addrs

    def initialize
      @total_count, @unique_count, @ip_addrs = 0, 0, Hash.new
    end

    def add(line)
      self.total_count += 1
      if !ip_addrs[line.ip_addr]
        self.ip_addrs[line.ip_addr] = true
        self.unique_count += 1
      end
    end
  end
end
