require 'pry'
require 'open-uri'
require 'mime/types'

module Imgfetcha
  class BatchFetcher
    VALID_TYPES = %w[jpeg jpg png].freeze

    attr_reader :urls, :output_dir

    def initialize(urls, options)
      @urls       = urls
      @output_dir = options[:output_dir] || Dir.pwd
      @verbose    = options[:verbose]
    end

    def run
      batch_download
    end

    private

    def batch_download
      urls.each_with_index do |url, i|
        print_progress(url, i)

        temp_file = URI.open(url)
        type = detect_type(temp_file)

        break unless validate_type(type, url)

        save_file(
          temp_file: temp_file,
          name: File.basename(URI.parse(url).path),
          type: type
        )
      end
    end

    def save_file(temp_file:, name:, type:)
      File.open("#{@output_dir}/#{name}.#{type}", 'wb') do |f|
        f.write(temp_file.read) ? print('OK') : print('ERROR')
      end
    end

    def detect_type(file)
      content_type = file.meta['content-type']
      MIME::Types[content_type].first.preferred_extension
    end

    def validate_type(type, url)
      return true if VALID_TYPES.include?(type)

      puts("Type #{type} is invalid: #{url}")
      false
    end

    def print_progress(url, index)
      print "\n[#{index + 1}/#{@urls.count}] Downloading #{url} "
    end
  end
end
