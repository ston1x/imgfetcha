require_relative 'lib/imgfetcha/version'

Gem::Specification.new do |spec|
  spec.name          = 'imgfetcha'
  spec.version       = Imgfetcha::VERSION
  spec.authors       = ['ston1x']
  spec.email         = ['stoianovnk@gmail.com']

  spec.summary       = 'Ruby gem that takes an input of image URLs and downloads them in batch'
  spec.description   = 'Uses input file as a list of URLs and downloads all the images'
  spec.homepage      = 'https://github.com/ston1x/imgfetcha'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = spec.homepage
  # TODO: Update with the changelog page
  spec.metadata['changelog_uri'] = spec.homepage

  # Specify which files should be added to the gem when it is released.
  spec.files         = Dir['lib/**/*.rb']
  spec.bindir        = 'bin'
  spec.executables   = ['imgfetcha']
  spec.require_paths = ['lib']

  # Specify runtime dependencies
  spec.add_development_dependency 'mime-types', '~> 3.1'

  # Specify development dependencies
  spec.add_development_dependency 'pry', '~> 0.13.1'
  spec.add_development_dependency 'rspec', '~> 3.9.0'
  spec.add_development_dependency 'rubocop', '0.88.0'
end
