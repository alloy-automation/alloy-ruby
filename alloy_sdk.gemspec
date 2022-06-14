# frozen_string_literal: true

require_relative "lib/alloy_sdk/version"

Gem::Specification.new do |spec|
  spec.name = "alloy_sdk"
  spec.version = AlloySdk::VERSION
  spec.authors = ["Viral Ruparel"]
  spec.email = ["viral@runalloy.com"]

  spec.summary = "Run Alloy workflows from a ruby server."
  spec.homepage = "https://github.com/alloy-automation/alloy-ruby"
  spec.required_ruby_version = ">= 2.6.0"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:bin|test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency "httparty", "0.13.1"
  spec.add_dependency "securerandom", "0.2.0"
  spec.add_dependency "faraday", "1.0.1"
  spec.add_dependency "timeout", "0.2.0"
  spec.add_dependency "json", "2.6.1"
end
