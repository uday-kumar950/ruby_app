RSpec.describe ServerLogParser::FeedreaderResult do
  let(:result) { described_class[grouped_records] }
  let(:grouped_records) {
    {
      "/about" => collector1,
      "/home" => collector2,
      "/contact-us" => collector3
    }
  }
  let(:collector1) { instance_double(ServerLogParser::Collector, unique_count: 5, total_count: 5) }
  let(:collector2) { instance_double(ServerLogParser::Collector, unique_count: 10, total_count: 25) }
  let(:collector3) { instance_double(ServerLogParser::Collector, unique_count: 2, total_count: 150) }


  describe "sort by unique count" do
    subject { result.sort_unique_count }

    let(:expected_sorted_records) {
      [
        ["/home", collector2],
        ["/about", collector1],
        ["/contact-us", collector3]
      ]
    }

    it { is_expected.to eql(expected_sorted_records) }
  end

  describe "sort by total count" do
    subject { result.sort_total_count }

    let(:expected_sorted_records) {
      [
        ["/contact-us", collector3],
        ["/home", collector2],
        ["/about", collector1]
      ]
    }

    it { is_expected.to eql(expected_sorted_records) }
  end

end
