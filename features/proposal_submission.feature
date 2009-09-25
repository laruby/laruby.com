Feature: Proposal submission
  In order to submit a proposal
  As a logged in user
  I want to provide good input
  
  Scenario: When I try to submit a proposal as an anonymous user I should be direct to the login page
    Given I am on the presentation index
    When I follow "Request a Presentation"
    Then I should be on the login page
  
  Scenario: As a logged in suer I want to see the right form
    Given I am the registered user John Doe
    And I am on the login page
    When I login with valid credentials
    And I go to the presentation index
    And I follow "Request a Presentation"
    Then I should be on the new presentation page
  
  
  
  
