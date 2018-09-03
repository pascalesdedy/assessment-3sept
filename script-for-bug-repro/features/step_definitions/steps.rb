require 'selenium-webdriver'
driver = Selenium::WebDriver.for :firefox

Given(/^I Open automationpractice.com$/) do
	driver.get "http://automationpractice.com"
	sleep(2)
end

When(/^I click our store link on the page footer$/) do 
	driver.find_element(:xpath,"//a[contains(text(),'Our stores')]").click	
end

Then(/^I should redirected to our store page$/) do
	check = driver.find_element(:xpath,"//div[@id='center_column']/h1").text
	if check == "OUR STORE(S)!"
	puts "on store"
	end
end

And(/^The google map is displayed properly$/) do
	map_text = driver.find_element(:xpath,"//div[@id='map']/div[2]/div[2]/span").text
	if map_text == "This page can't load Google Maps correctly."
		driver.save_screenshot('screenshot.png')
	end
end
	

Given(/^I Open automationpractice.com index page$/) do
	driver.get "http://automationpractice.com"
	sleep(2)
end

When(/^scroll down on facebook widget/block$/) do
	driver.find_element(:xpath,"//div[@id='facebook_block']")
end

Then(/^I am the facebook page widget is displayed$/) do
	if driver.find_element(:xpath,"//div[@id='facebook_block']").displayed?
		driver.save_screenshot('screenshot.png')
	end
end
