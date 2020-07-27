module Imgfetcha
  class FileReader
    attr_reader :input_file, :output_directory, :result

    def initialize(options)
      @input_file       = options[:input_file]
      @output_directory = options[:output_directory] || Dir.pwd
    end

    def run
      raise InputFileNotSpecifiedError unless @input_file

      read_file
      validate_urls
    end

    private

    def read_file
      # Expand path so that Dir#chdir would understand paths relative to home
      @contents = File.read(File.expand_path(@input_file)).split
    end

    def validate_urls
      @result = @contents.select { |url| URI.parse(url).is_a?(URI::HTTP) }
    end
  end
end
