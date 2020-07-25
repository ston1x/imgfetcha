require 'imgfetcha/version'
require 'imgfetcha/arg_parser'

module Imgfetcha
  def self.run
    parser = ArgParser.new
    parser.parse
    # TODO: send options to ImgProcessor
  rescue StandardError, NotImplementedError => e
    puts e.class, e.message
  end
end
