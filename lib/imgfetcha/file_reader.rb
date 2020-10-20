module Imgfetcha
  class FileReader
    attr_reader :input_file, :result

    def initialize(options)
      @input_file = options[:input_file]
      @verbose    = options[:verbose]
    end

    def run
      read_file
      filter_urls
      report_results if @verbose
      @result
    end

    private

    def read_file
      raise InputFileNotSpecifiedError unless @input_file

      # Expand path so that Dir#chdir would understand paths relative to home
      @contents = File.read(File.expand_path(@input_file)).split
    end

    def filter_urls
      @result = @contents.select { |line| URI.parse(line).is_a?(URI::HTTP) }
      raise NoUrlsFoundError if @result.empty?

      # TODO: group valid and unvalid URLs, warn about invalid ones

      @result
    end

    def report_results
      puts "Found #{@result.count} URLs in #{@contents.count} lines:"
      puts @result
    end
  end
end
