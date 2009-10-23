Feature: Header Links
As a user
I want to be able to view all the header links

Scenario: Top Navigation Links
Given I am on the homepage
Then I should see "Login"
  And I should see "Register"
  And I should see "Home"
  And I should see "Connect"
  And I should see "About"
When I follow "Login"
  Then I should be on /login
When I follow "Register"
  Then I should be on /account/new
When I follow "Home"
  Then I should be on /
When I follow "Connect"
  Then I should be on /connect
When I follow "About"
  Then I should be on /about