RSpec.describe ServerLogParser::Feedreader do
  let(:feedreader) { described_class.new(log_records) }
  let(:log_records) {
    [
      ServerLogParser::Line.new("/help_page/1", "836.973.694.403"),
      ServerLogParser::Line.new("/about/2", "184.123.665.067"),
      ServerLogParser::Line.new("/help_page/1", "836.973.694.403"),
      ServerLogParser::Line.new("/about/2", "184.123.665.067"),
      ServerLogParser::Line.new("/help_page/1", "836.973.694.403")
    ]
  }

  describe "group visits" do
    subject(:group_visits) { feedreader.group }

    it "generates total views" do
      expect(group_visits.fetch("/about/2").total_count).to eql(2)
    end

    it "group page visits" do
      expect(group_visits.keys).to match_array(["/help_page/1", "/about/2"])
    end
  end
end
