module Imgfetcha
  class FileReader
    class InputFileNotSpecifiedError < StandardError
      attr_reader :message

      def initialize
        @message = "Input file was not specified. Please provide the input file with '-i INPUT_FILE'"
      end
    end
  end
end
