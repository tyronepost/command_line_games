Gem::Specification.new do |spec|
  spec.name = "chess"
  spec.summary = "learn to play chess"
  spec.version = "0.0.1"
  spec.author = "Tyrone Post"
  spec.email = "tyrone.post.a@gmail.com"
  spec.homepage = "https://tyronepost.io"
  spec.license = "Nonstandard"

  spec.platform = Gem::Platform::RUBY
  spec.required_ruby_version = ">= 2.3.0"
  spec.files   = Dir["lib/**/*"]
  spec.test_files = Dir["test/*_test.rb"]
end