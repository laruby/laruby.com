Feature: Proposal submission
  In order to submit a proposal
  As a logged in user
  I want to provide good input
  
  Scenario: When I try to submit a proposal as an anonymous user I should be direct to the login page
    Given I am on the presentation index
    When I follow "Request a Presentation"
    Then I should be on the login page
  
  @logged_in
  Scenario: As a logged in user I want to see the right form
    Given I am on the presentation index
    When I follow "Request a Presentation"
    Then I should be on the new presentation page

  @create_presentation_valid_data
  Scenario: As a logged in user I want to be able to submit a valid presentation
    Given I am on the new presentation page
    When I fill in the following:
        |Subject|Cucumber tests|
        |Difficulty level|Beginner|
        |Duration|30|
        |Description|Some cool stuff|
      And I press "Request"
    Then I should be on the presentation index
      And I should see "successfully created"
      And I should see "Cucumber tests"
      And I should see "Some cool stuff"
  
  @create_presentation_invalid_data
  Scenario: As a logged in user I should not be able to create a presentation with invalid data
    Given I am on the new presentation page
    When I fill in the following:
        |Difficulty level|Beginner|
        |Duration|30|
        |Description|Some cool stuff|
      And I press "Request"
    Then the "Duration" field should contain "30"
      And the "Description" field should contain "Some cool stuff"
      And I should see "Subject can't be blank"
  
  
  
