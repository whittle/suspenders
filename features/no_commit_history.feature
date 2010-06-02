Feature: There is no commit history from suspenders on the project

  Scenario: Inspecting the commit log
   Then there should only be 3 commits
   And there should be a commit "First commit for test_project"
   And there should be a commit "Initial commit from Suspenders"
