require 'spec_helper'

module LogAnalytics
  describe Parser do
    let(:parser) { Parser.new(double) }
    let(:lines) do
      "/path1 127.0.0.1\n" \
      "/path2 127.0.0.2\n"
    end

    before :each do
      allow(File).to receive(:read).and_return(lines)
    end

    describe '#entries' do
      it 'returns an array of entries' do
        expect(parser.entries).to be_a(Array)
        expect(parser.entries.first).to be_a(Entry)
      end
    end

    describe '#report' do
      it 'returns a formatted report' do
        formatter = double('Formatter')

        expect(formatter).to receive(:render)
        parser.report(formatter)
      end
    end
  end
end
