# coding: UTF-8

Gem::Specification.new do |s|
  s.name              = "error-page"
  s.version           = "0.0.1"
  s.platform          = Gem::Platform::RUBY
  s.authors           = ["Zark Zork"]
  s.email             = ["zarkzork@gmail.com"]
  s.summary           = "middleware for showing error pages"
  s.description       = "use with rack"
  s.rubyforge_project = s.name


  s.add_runtime_dependency "rack"
  s.add_runtime_dependency "tilt"

  # The list of files to be contained in the gem
  s.files         = `git ls-files`.split("\n")
    
  s.require_path = 'lib'

end
