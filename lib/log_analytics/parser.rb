module LogAnalytics
  class Parser
    attr_reader :log_file
    attr_accessor :log_entries

    def initialize(log_file)
      @log_file = log_file
      @log_entries = []
    end

    def entries
      parse_log_file
      log_entries
    end

    def report(formatter)
      formatter.render(entries)
    end

    private

      def parse_log_file
        File.read(log_file).each_line do |line|
          path, ip = line.split
          log_entries << Entry.new(path: path, ip: ip)
        end
      end
  end
end
