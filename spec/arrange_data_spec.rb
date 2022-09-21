RSpec.describe ServerLogParser::ArrangeData do
  let(:arrange_data) { described_class.new(feedreader_result) }
  let(:collector1) { ServerLogParser::Collector.new }
  let(:collector2) { ServerLogParser::Collector.new }
  let(:collector3) { ServerLogParser::Collector.new }

  describe "arrange data" do
    
    before do
      collector1.unique_count = 4
      collector1.total_count = 90
      collector2.unique_count = 12
      collector2.total_count = 30
      collector3.unique_count = 14
      collector3.total_count = 170
    end

    let(:feedreader_result) {
      ServerLogParser::FeedreaderResult[
        "/help_page/1" => collector1,
        "/about" => collector2,
        "/index" => collector3
      ]
    }
    let(:formatted_result) { arrange_data.result }
    let(:total_visits_data) { arrange_data.total_visits }
    let(:unique_visits_data) {arrange_data.unique_visits}

    let(:total_visits_data_result) { "/index 170 views\n/help_page/1 90 views\n/about 30 views" }
    let(:unique_visits_data_result) {"/index 14 unique visits\n/about 12 unique visits\n/help_page/1 4 unique visits"}

    it {  
      expect(total_visits_data).to eq(total_visits_data_result) 
      expect(unique_visits_data).to eq(unique_visits_data_result) }
    end
  end
