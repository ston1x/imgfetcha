require 'open-uri'
require 'mime/types'

module Imgfetcha
  class BatchFetcher
    # NOTE: 'bin' stands for `application/octet-stream`
    VALID_TYPES = %w[jpeg jpg png gif heic bin].freeze

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

        next unless validate_type(type)

        write_file(temp_file: temp_file, name: file_name(url, temp_file))
        url
      end.compact
    end

    # Get basename from a URL
    def file_name(url, file)
      name = File.basename(URI.parse(url).path)
      # Append type if valid types aren't contained in the name
      name += ".#{detect_type(file)}" unless VALID_TYPES.any? { |type| name.include?(type) }

      name
    end

    def write_file(temp_file:, name:)
      File.open("#{@output_dir}/#{name}", 'wb') do |f|
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
