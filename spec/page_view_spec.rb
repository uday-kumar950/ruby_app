RSpec.describe ServerLogParser::PageView do
  let(:page_view) { described_class.new(lines) }
  let(:lines) {
    [
      "/index 929.398.951.889",
      "/help_page/1 543.910.244.929"
    ]
  }

  describe "log records" do
    subject { page_view.records.to_a }

    let(:expected_records) {
      [
        ServerLogParser::Line.new("/index", "929.398.951.889"),
        ServerLogParser::Line.new("/help_page/1", "543.910.244.929")
      ]
    }

    it { is_expected.to eql(expected_records) }
  end
end
