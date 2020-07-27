require 'optparse'

module Imgfetcha
  class ArgParser
    attr_accessor :result

    def initialize
      @result = {}
    end

    def run
      execute_parser
    end

    private

    # rubocop:disable Metrics/MethodLength
    def execute_parser
      OptionParser.new do |opts|
        # TODO: Update it
        opts.banner = 'Usage: imgfetcha -i INPUT_FILE -o OUTPUT_DIRECTORY'

        opts.on('-v', '--[no-]verbose', 'Run verbosely') do |v|
          @result[:verbose] = v
        end

        opts.on('-i INPUT_FILE', '--input=INPUT_FILE', 'Specify input file') do |i|
          @result[:input_file] = i
        end

        opts.on('-o OUTPUT_DIRECTORY', '--output=OUTPUT_DIRECTORY', 'Specify output directory') do |o|
          @result[:output_directory] = o
        end

        opts.on('-V', '--version', 'Print version') do
          puts Imgfetcha::VERSION
          exit
        end

        opts.on('-h', '--help', 'Print this help') do
          puts opts
          exit
        end
      end.parse!
    end
    # rubocop:enable Metrics/MethodLength
  end
end
