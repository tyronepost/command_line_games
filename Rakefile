require 'rake/testtask'

def rake(*args)
  ruby "-S", "rake", *args
end

Rake::TestTask.new do |t|
  t.libs << %w[test lib]
  t.test_files = FileList['**/test/**/*_test.rb']
  t.warning = false
end

task :bundle do
  ruby "-S", "bundle", "install"
end

task install: [:bundle] do
  sub_dirs = %w[chess tictactoe]
  sub_dirs.each do |dir|
    Dir.chdir(dir) do
      rake "build"
      rake "install"
    end
  end
end

task :default => :test
