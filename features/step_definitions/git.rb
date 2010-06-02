Then 'there should only be 3 commits' do
  Dir.chdir('test_project') do
    number_from_git = `git log --oneline | wc -l`
    number_from_git.strip.should == "3"
  end
end

Then 'there should be a commit "$commit"' do |commit|
  Dir.chdir('test_project') do
    git_log = `git log`
    git_log.should match(commit)
  end
end
