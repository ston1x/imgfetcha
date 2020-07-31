# imgfetcha


[![ston1x](https://circleci.com/gh/ston1x/imgfetcha.svg?style=svg)](https://github.com/ston1x/imgfetcha)

imgfetcha is a Ruby gem for batch downloading images from a URL. It supports `.jpg`, `.png`, `.gif`, `.heic` file types but you can customize it in code. As of version `0.2.0`, it supports `octet-stream` file types as well (you can use attachment links without image preview where downloading automatically begins).

## Installation

Clone the repository:
```sh
git clone https://github.com/ston1x/imgfetcha.git
```

Navigate into the directory:
```sh
cd imgfetcha
```

Build the gem:
```sh
gem build imgfetcha.gemspec
```

Install the gem:
```sh
gem install imgfetcha-0.2.0.gem
```

## Usage
```sh
mkdir ~/image_downloads
imgfetcha -i example_input.txt -o ~/image_downloads -v
```

```sh
imgfetcha --help
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ston1x/imgfetcha. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/ston1x/imgfetcha/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Imgfetcha project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/ston1x/imgfetcha/blob/master/CODE_OF_CONDUCT.md).
