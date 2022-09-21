RSpec.describe ServerLogParser::Collector do
  let(:collector) { described_class.new }

  describe "add line" do
    subject(:add_line) { collector.add(line) }

    let(:line) { ServerLogParser::Line.new("/about/2", "543.910.244.929") }

    it "increments total count views" do
      expect { add_line }.to change { collector.total_count }.by(1)
    end

    it "increments unique views" do
      expect { add_line }.to change { collector.unique_count }.by(1)
    end

    context "with existing entry ip" do
      before { collector.ip_addrs["543.910.244.929"] = true }

      it "does not increment unique views" do
        expect { add_line }.to_not change { collector.unique_count }
      end
    end
  end
end
