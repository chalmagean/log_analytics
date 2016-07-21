module LogAnalytics
  class VisitCountFormatter
    def render(entries)
      sorted(entries).each do |path, size|
        puts "#{path} #{size} visits"
      end
    end

    private

      def group_by_path(entries)
        entries.group_by { |entry| entry.path }
      end

      def group_by_size(entries)
        group_by_path(entries).map do |path, entries|
          [path, entries.size]
        end
      end

      def sorted(entries)
        group_by_size(entries).sort { |a, b| b.last <=> a.last }
      end
  end
end

