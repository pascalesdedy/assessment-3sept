Feature: Scripts for bug reproduction 
@bug-ourstore
Scenario: As a User I want to check google map on Our store section
	Given I Open automationpractice.com
	When I click our store link on the page footer 
	Then I should redirected to our store page
	And The google map is displayed properly

@bug-facebook-widget
Scenario: As a user I want to check for company's facebook page
	Given I open automationpractice.com index page
	When scroll down on facebook widget/block
	Then I am the facebook page widget is displayed 
