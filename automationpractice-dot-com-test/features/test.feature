Feature: Assesment test automationpractice.com
@register
Scenario: User registers as new user
	Given I Open automationpractice.com login page
	When I enter all required data for registering
	And I click on register button
	Then I should redirected to my new account page

@valid-login
Scenario: As a user I want to sign in with a valid login credential
	Given I open automationpractice.com login page 2nd
	When I enter a valid credential
	And I click on sign in button
	Then I am allowed to login

@invalid-login
Scenario: As a user I want to sign in with an invalid login credential
	Given I open automationpractice.com login page 3rd
	When I enter an invalid credential
	And I click on sign in button with invalid credential
	Then I am not allowed to login

@purchase-invalid
Scenario: As a user I want purchase item as an unregistered user
	Given I open automationpractice.com as unregistered user
	When I purchase item as unregistered user
	And I click checkout
	Then I am not allowed to purchase

@purchase-valid
Scenario: As a user I want purchase item as a registered user
	Given I open automationpractice.com as a registered user
	When I purchase item as registered user
	Then I am allowed to purchase