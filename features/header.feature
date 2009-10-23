Feature: Header Links
As a user
I want to be able to view all the header links

Scenario: Top Navigation Links
Given I am on the homepage
Then I should see "Login"
  And I should see "Register"
When I follow "Login"
  Then I should be on /login
When I follow "Register"
  Then I should be on /account/new