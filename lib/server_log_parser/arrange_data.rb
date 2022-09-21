module ServerLogParser
  class ArrangeData
    def initialize(feedreader_result)
      @feedreader_result = feedreader_result
    end

    def result
      <<~EOF
        ************List of webpages with most page views*******************
        #{total_visits} \n
        *********List of webpages with most unique page views************
        #{unique_visits}
      EOF
    end

    def unique_visits
      @feedreader_result.sort_unique_count.map { |path, collector| "#{path} #{collector.unique_count} unique visits" }.join("\n")
    end

    def total_visits
      @feedreader_result.sort_total_count.map { |path, collector| "#{path} #{collector.total_count} views" }.join("\n")
    end

  end
end