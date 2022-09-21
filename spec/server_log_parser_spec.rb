RSpec.describe ServerLogParser::Parser do
  let(:log_parser) { described_class.new("path/filename") }
  describe "serverlog parse" do
    subject { log_parser.result }

    let(:read_file) {instance_double(ServerLogParser::ReadFile, lines: ["/help_page/1 836.973.694.403", "/about/2 543.910.244.929"])}

    before { allow(ServerLogParser::ReadFile).to receive(:new).with("path/filename").and_return(read_file); }

    it { is_expected.to include("List of webpages with most page views") }
  end
end
