require 'imgfetcha/version'
require 'imgfetcha/arg_parser'
require 'imgfetcha/file_reader'
require 'imgfetcha/errors/input_file_not_specified_error'
require 'imgfetcha/errors/no_urls_found_error'

module Imgfetcha
  def self.run
    parser = ArgParser.new
    parser.run

    reader = FileReader.new(parser.result)
    reader.run

    # TODO: send options to ImgProcessor
  rescue StandardError, NotImplementedError => e
    puts e.class, e.message
  end
end
