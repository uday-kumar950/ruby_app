RSpec.describe ServerLogParser::ReadFile do
  let(:file_path) { File.expand_path("../fixtures/test_server.log", __FILE__) }
  let(:reader) { described_class.new(file_path) }

  describe "read lines" do
    subject(:lines) { reader.lines.to_a }

    let(:expected_lines) { ["/help_page/1", "/help_page/2", "/help_page/3", "/help_page/4"] }

    it { is_expected.to eql(expected_lines) }

    context "with invalid path" do
      let(:file_path) { "somepath/no_data.log" }

      it "raises error" do
        expect { lines }.to raise_error(ServerLogParser::CustomError)
      end
    end
  end
end
