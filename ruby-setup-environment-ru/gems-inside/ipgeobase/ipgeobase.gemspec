# frozen_string_literal: true

require_relative 'lib/ipgeobase/version'

Gem::Specification.new do |spec|
  spec.name = 'ipgeobase'
  spec.version = Ipgeobase::VERSION
  spec.authors = ['Mikhail A Larin']
  spec.email = ['mlarin74@gmail.com']

  spec.summary = 'Test task'
  spec.description = 'Test task'
  spec.homepage = 'https://github.com/m-larin/hexlet-assignments/ruby-setup-environment-ru/gems-inside/ipgeobase'
  spec.required_ruby_version = '>= 2.6.0'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/m-larin/hexlet-assignments/ruby-setup-environment-ru/gems-inside/ipgeobase'
  spec.metadata['changelog_uri'] = 'https://github.com/m-larin/hexlet-assignments/ruby-setup-environment-ru/gems-inside/ipgeobase'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'addressable'
  spec.add_dependency 'minitest-power_assert'
  spec.add_dependency 'nokogiri-happymapper'
  spec.add_dependency 'simplecov'
  spec.add_dependency 'webmock'

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata['rubygems_mfa_required'] = 'true'
end
