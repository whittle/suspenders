When 'I run the rake task "$task_name"' do |task_name|
  Dir.chdir('test_project') do
    system("rake #{task_name}")
  end
end

When 'I generate "$generator_with_args"' do |generator_with_args|
  Dir.chdir('test_project') do
    system("./script/generate #{generator_with_args}")
  end
end

Then 'I see a successful response in the shell' do
  $?.to_i.should == 0
end

When 'I drop and create the required databases' do
  Dir.chdir('test_project') do
    system("rake db:drop RAILS_ENV=test")
    system("rake db:drop")
    system("rake db:create RAILS_ENV=test")
    system("rake db:create")
  end
end

When /I create a project called (\w+) with SUDO set to (\w+)/ do |project_name, sudo|
  bin_path = File.expand_path('../../bin', File.dirname(__FILE__))
  sudo_path = File.expand_path('../support/bin', File.dirname(__FILE__))
  command = "PATH=#{sudo_path}:#{ENV['PATH']} SUDO=#{sudo} #{bin_path}/suspenders create #{project_name} 2>&1"
  puts "*"*80
  puts "Running command:\n#{command}"
  puts "*"*80
  out = `#{command}`
  fail "Creating project #{project_name} failed: #$?\n#{out}" if $? != 0
end

Given 'the fake sudo command is used' do
  path = File.dirname(__FILE__) + '/support/bin'
  ENV['PATH'] = "#{path}:#{ENV['PATH']}"
end

Given 'I set the $variable environment variable to $value' do |variable, value|
  ENV[variable] = value
end

Then 'the sudo command should not have been used' do
  File.exists?('../support/sudos_used').should be_false
end

Then 'the following commands should have been called with sudo' do |table|
  contents = IO.read(File.expand_path('../support/sudos_used', File.dirname(__FILE__)))
  contents.should include(row['command'])
end

When 'the following gems are not installed' do |table|
  table.hashes.each do |row|
    SourceIndex.fake_uninstall_gem(row['gem'])
  end
end

