require 'spec_helper'

describe LogAnalytics do
  it 'reports the number of unique views for each path' do
    log_file = File.dirname(__FILE__) + '/fixtures/webserver.log'
    expected = <<-EOS
/help_page/1 23 unique views
/contact 23 unique views
/home 23 unique views
/index 23 unique views
/about/2 22 unique views
/about 21 unique views
EOS

    parser = LogAnalytics::Parser.new(log_file)

    formatter = LogAnalytics::UniqueViewFormatter.new
    expect { parser.report(formatter) }.to output(expected).to_stdout
  end
end
