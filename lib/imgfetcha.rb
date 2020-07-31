require 'imgfetcha/version'
require 'imgfetcha/arg_parser'
require 'imgfetcha/file_reader'
require 'imgfetcha/batch_fetcher'
require 'imgfetcha/errors/input_file_not_specified_error'
require 'imgfetcha/errors/no_urls_found_error'

module Imgfetcha
  def self.run
    parser = ArgParser.new
    options = parser.run

    reader = FileReader.new(options)
    reader.run

    downloader = BatchFetcher.new(reader.result, options)
    downloader.run
  rescue StandardError, NotImplementedError => e
    puts e.class, e.message
    puts e.backtrace if options[:verbose]
  end
end
