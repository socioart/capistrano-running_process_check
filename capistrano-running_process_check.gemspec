require_relative "lib/capistrano/running_process_check/version"

Gem::Specification.new do |spec|
  spec.name          = "capistrano-running_process_check"
  spec.version       = Capistrano::RunningProcessCheck::VERSION
  spec.authors       = ["labocho"]
  spec.email         = ["labocho@penguinlab.jp"]

  spec.summary       = "Add checking runnning process before all Capistrano tasks"
  spec.description   = "Add checking runnning process before all Capistrano tasks"
  spec.homepage      = "https://github.com/socioart/capistrano-running_process_check"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.6.0")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/socioart/capistrano-running_process_check"
  spec.metadata["changelog_uri"] = "https://github.com/socioart/capistrano-running_process_check/blob/master/CHAGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject {|f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r(^exe/)) {|f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "capistrano", ">= 3"

  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop", "~> 1.37"
  spec.metadata["rubygems_mfa_required"] = "true"
end
