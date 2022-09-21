module ServerLogParser
  class FeedreaderResult < Hash
    def sort_total_count
      sort_by { |_, pages| -pages.total_count }
    end

    def sort_unique_count
      sort_by { |_, pages| -pages.unique_count }
    end
  end
end
