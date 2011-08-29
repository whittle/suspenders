Feature: Rake works in the suspended project

  Background:
    Given I drop and create the required databases

  Scenario: Running features
    When I run the rake task "cucumber"
    Then I see a successful response in the shell

  Scenario: Running spec on a new model
    When I generate "model post title:string"
    And I run the rake task "db:migrate"
    And I run the rake task "db:test:prepare"
    And I run the rake task "spec"
    Then I see a successful response in the shell
