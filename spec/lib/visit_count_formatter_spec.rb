require 'spec_helper'

module LogAnalytics
  describe VisitCountFormatter do
    let(:entries) do
      [
        double('Entry', path: '/path1', ip: '127.0.0.1'),
        double('Entry', path: '/path1', ip: '127.0.0.2'),
        double('Entry', path: '/path1', ip: '127.0.0.2'), # not unique
        double('Entry', path: '/path2', ip: '127.0.0.1'),
      ]
    end

    describe '#render' do
      it 'outputs entries sorted by the number of unique views' do
        formatter = VisitCountFormatter.new
        expected = <<-EXPECTED
/path1 3 visits
/path2 1 visits
EXPECTED
        expect { formatter.render(entries) }.to output(expected).to_stdout
      end
    end
  end
end

