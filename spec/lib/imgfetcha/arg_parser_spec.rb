describe Imgfetcha::ArgParser do
  subject { described_class.new }

  before do
    ARGV.replace args
  end

  describe '#run' do
    context 'with supported args' do
      let(:expected_result) do
        {
          verbose: true,
          input_file: '~/file.txt',
          output_directory: '~/output/'
        }
      end

      context 'when supported args are given in short letters' do
        let(:args) { %w[-i ~/file.txt -o ~/output/ -v] }

        it 'returns parsed options' do
          subject.run
          expect(subject.result).to eq(expected_result)
        end
      end

      context 'when supported args are given in full words' do
        let(:args) { %w[--input=~/file.txt --output=~/output/ --verbose] }

        it 'returns parsed options' do
          subject.run
          expect(subject.result).to eq(expected_result)
        end
      end
    end

    context 'with unsupported args' do
      let(:args) { %w[--some-arg -a] }

      it 'raises InvalidOption error' do
        expect { subject.run }.to raise_error(OptionParser::InvalidOption)
      end
    end
  end
end
