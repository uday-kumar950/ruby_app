module ServerLogParser
  class Feedreader
    def initialize(records)
      @records = records
    end

    def group
      @records.each_with_object(FeedreaderResult.new) do |record, collection|
        collection[record.visit_path] ||= Collector.new
        collection[record.visit_path].add(record)
      end
    end
  end
end
