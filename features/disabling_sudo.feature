Feature: Disabling sudo with an environment variable

  @creates_blog
  Scenario: the sudo environment variable is not set
    When I create a project called blog with SUDO set to true
    Then the following commands should have been called with sudo
      | command                      |
      | gem install install nokogiri |
      | gem install RedCloth         |

  @creates_blog
  Scenario: the sudo environment variable is set to false
    When I create a project called blog with SUDO set to false
    Then the sudo command should not have been used
