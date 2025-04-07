# frozen_string_literal: true

require_relative "lib/solid_queue_plus/version"

Gem::Specification.new do |spec|
  spec.name = "solid_queue_plus"
  spec.version = SolidQueuePlus::VERSION
  spec.authors = ["Sukhendar"]
  spec.email = ["sukhendar.sd@gmail.com"]

  spec.summary       = "Enhancements for Rails 8 Solid Queue: retries, notifications, dashboard."
  spec.description   = "Provides retry logic, failure notifications, and a lightweight dashboard for Solid Queue in Rails 8+ applications."
  spec.homepage      = "https://github.com/Sukendhar/solid_queue_plus"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")
  spec.metadata["homepage_uri"] = spec.homepage

  spec.files         = Dir["lib/**/*", "MIT-LICENSE", "README.md"]
  spec.require_paths = ["lib"]

  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }

  spec.add_dependency "rails", ">= 8.0.0"
  spec.add_dependency "solid_queue", ">= 0.1.0"
  spec.add_dependency "slack-notifier"
  spec.add_development_dependency "rspec"
end
