describe Imgfetcha::FileReader do
  let(:output_directory) { 'spec/fixtures/' }
  let(:lines)            { File.read(File.expand_path(input_file)).split.count }
  let(:options) do
    {
      output_directory: output_directory,
      input_file: input_file
    }
  end

  subject { described_class.new(options) }

  describe '#run' do
    context 'when a correct file is given' do
      let(:input_file) { 'spec/fixtures/correct_file.txt' }

      it 'parses all the URLs' do
        expect(subject.run.count).to eq(lines)
      end
    end

    context 'when a partially correct file is given' do
      let(:input_file) { 'spec/fixtures/partially_correct_file.txt' }

      it 'filters only valid URLs' do
        expect(subject.run.count).to be < lines
      end
    end

    context 'when a totally incorrect file is given' do
      let(:input_file) { 'spec/fixtures/incorrect_file.txt' }

      it 'raises NoUrlsFoundError error' do
        expect { subject.run }.to raise_error(described_class::NoUrlsFoundError)
      end
    end
  end
end
