require 'pry'
require 'open-uri'
require 'mime/types'

module Imgfetcha
  class BatchFetcher
    VALID_TYPES = %w[jpeg jpg png].freeze

    attr_reader :urls, :output_dir, :result

    def initialize(urls, options)
      @urls       = urls
      @output_dir = options[:output_dir] || Dir.pwd
      @verbose    = options[:verbose]
    end

    def run
      @result = batch_download
      puts "\nDownloaded #{@result.count} images"
      @result
    end

    private

    def batch_download
      urls.map.with_index do |url, i|
        print_progress(url, i)
        temp_file = URI.open(url)
        type      = detect_type(temp_file)

        next unless validate_type(type, url)

        write_file(temp_file: temp_file, name: file_name(url), type: type)
        url
      end.compact
    end

    # Get basename from a URL
    def file_name(url)
      File.basename(URI.parse(url).path)
    end

    def write_file(temp_file:, name:, type:)
      File.open("#{@output_dir}/#{name}.#{type}", 'wb') do |f|
        f.write(temp_file.read) ? print('OK') : print('ERROR')
      end
    end

    def detect_type(file)
      content_type = file.meta['content-type']
      MIME::Types[content_type].first.preferred_extension
    end

    def validate_type(type)
      return true if VALID_TYPES.include?(type)

      print("ERROR: Type #{type} is invalid")
      false
    end

    def print_progress(url, index)
      print "\n[#{index + 1}/#{@urls.count}] Downloading #{url} "
    end
  end
end
