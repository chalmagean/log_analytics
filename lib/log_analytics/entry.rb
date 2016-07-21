module LogAnalytics
  class Entry
    attr_reader :path, :ip

    def initialize(path:, ip:)
      @path = path
      @ip = ip
    end
  end
end
