Feature: Proposal editing
  In order to update a proposal
  As a logged in user
  I want edit my proposal


@logged_in
	Scenario: Viewing a proposal
    Given there is a valid proposal
		And I am on the homepage
    When I follow "Valid Proposal"
    Then I should see "Valid Proposal"
		And I should see "Edit"