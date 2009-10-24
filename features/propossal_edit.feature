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
		
		
@logged_in
	Scenario: editing a proposal
		Given there is a valid proposal
		And I am on the homepage
		When I follow "Valid Proposal"
		And I follow "Edit"
		Then the "Subject" field should contain "Valid Proposal"
		  And the "Duration" field should contain "30"
      And the "Description" field should contain "Some cool stuff"
      And I should see "Subject is too short"
			And I should see "Save"
			And I press "Save"
			Then I should see ""