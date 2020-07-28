module Imgfetcha
  class FileReader
    class NoUrlsFoundError < StandardError
      attr_reader :message

      def initialize
        @message = "The input file doesn't seem to have any valid URLs"
      end
    end
  end
end
