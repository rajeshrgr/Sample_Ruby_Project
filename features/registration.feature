@demoqa
Feature: registration for demoqa
As a user
In order to register for demoqa
I need to be there in demoqa home page

@registration
Scenario:new registration with valid details
	Given I am on demoqa home page
	When I click on registration
	And I enter all the valid details
	And I click on submit button
	Then I should get the proper message