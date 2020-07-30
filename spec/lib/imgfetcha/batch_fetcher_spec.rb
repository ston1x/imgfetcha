describe Imgfetcha::BatchFetcher do
  let(:options) do
    {
      input_file: input_file
    }
  end
  let(:reader) { Imgfetcha::FileReader.new(options) }
  subject      { described_class.new(reader.run, options) }

  describe '#run' do
    context "when URLs don't contain valid content-type" do
      let(:input_file) { 'spec/fixtures/partially_correct_file.txt' }

      it "doesn't download anything" do
        expect(subject.run).to eq([])
      end
    end

    context 'when all URLs have valid content-type' do
      let(:input_file) { 'example_input.txt' }

      it 'downloads all the images' do
        lines = File.read(File.expand_path(input_file)).split
        expect(subject.run.count).to eq(lines.count)
      end
    end
  end
end
