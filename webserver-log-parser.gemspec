# frozen_string_literal: true

require_relative "lib/webserver/parser/version"

Gem::Specification.new do |spec|
  spec.name          = "webserver-log-parser"
  spec.version       = Webserver::Parser::VERSION
  spec.authors       = ["rtrochim"]
  spec.email         = ["rtrochim@users.noreply.github.com"]

  spec.summary       = "Small gem for parsing a logfile."
  spec.homepage      = "https://www.github.com/rtrochim/webserver-log-parser"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.4.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://www.github.com/rtrochim/webserver-log-parser"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir = "exe"
  spec.executables << "webserver-log-parser"
  spec.require_paths = ["lib"]
end
