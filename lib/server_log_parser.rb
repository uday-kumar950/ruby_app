
require_relative "server_log_parser/read_file"
require_relative "server_log_parser/page_view"
require_relative "server_log_parser/collector"
require_relative "server_log_parser/feedreader"
require_relative "server_log_parser/feedreader_result"
require_relative "server_log_parser/arrange_data"


module ServerLogParser
  class Parser
    def initialize(data, args ={})
      @data = data
      @arrange_data = args[:arrange_data] || ArrangeData
      @page_view = args[:page_view] || PageView
      @read_file = args[:reader] || ReadFile
    end

    def result
      @arrange_data.new(collected_data).result
    end

    private

    def collected_data
      records = @page_view.new(read_data).records
      Feedreader.new(records).group
    end

    def read_data
      @read_file.new(@data).lines
    end
  end
end



file_path = '/home/uday/Desktop/Smart_Pension_-_Take_Home_Ruby_test__14_/ruby_app/webserver.log'
parser =  ServerLogParser::Parser.new(file_path)
puts parser.result
