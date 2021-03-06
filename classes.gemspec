# frozen_string_literal: true

require_relative "lib/classes/version"

Gem::Specification.new do |spec|
  spec.name = "classes"
  spec.version = Classes::VERSION
  spec.authors = ["Todd Yandell"]
  spec.email = ["tyandell@gmail.com"]

  spec.summary = "A helper for building CSS class names"
  spec.description = "classes is a helper for building CSS class names in your Rails or Sinatra views. It's great for toggling individual classes or combining class names across your views and partials."
  spec.homepage = "https://github.com/tyandell/classes"
  spec.license = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["source_code_uri"] = spec.homepage

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
