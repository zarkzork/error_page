begin
  require "bundler"
  Bundler.setup
rescue LoadError
  $stderr.puts "You need to have Bundler installed to be able build this gem."
end

gemspec = eval(File.read(Dir["*.gemspec"].first))

desc "Copy contents of the gem to directory. Usage: rake copy[/path]"
task :copy, :path do |t, args|
  system "for i in $(git ls-files); do mkdir -p #{args.path}/$(dirname $i);cp -r $i #{args.path}/$(dirname $i)/; done"
end

desc "Validate the gemspec"
task :gemspec do
  gemspec.validate
end

desc "Build gem locally"
task :build => :gemspec do
  system "gem build #{gemspec.name}.gemspec"
  FileUtils.mkdir_p "pkg"
  FileUtils.mv "#{gemspec.name}-#{gemspec.version}.gem", "pkg"
end

desc "Install gem locally"
task :install => :build do
  system "gem install pkg/#{gemspec.name}-#{gemspec.version}"
end

desc "Clean automatically generated files"
task :clean do
  FileUtils.rm_rf "pkg"
end
