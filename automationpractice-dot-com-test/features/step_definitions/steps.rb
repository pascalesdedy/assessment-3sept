require 'selenium-webdriver'
driver = Selenium::WebDriver.for :firefox

Given(/^I Open automationpractice.com login page$/) do
	driver.get "http://automationpractice.com/index.php?controller=authentication&back=my-account"
	sleep(2)
end

When(/^I enter all required data for registering$/) do 	
	driver.find_element(:xpath,"//input[@id='email_create']").send_keys("dedy10@dedy.com")
	driver.find_element(:xpath,"//button[@id='SubmitCreate']/span").click
	sleep(5)
	driver.find_element(:xpath,"//input[@id='id_gender1']").click
	driver.find_element(:xpath,"//input[@id='customer_firstname']").send_keys("dedya")
	driver.find_element(:xpath,"//input[@id='customer_lastname']").send_keys("testa")
	driver.find_element(:xpath,"//input[@id='passwd']").send_keys("123456")
	
	#Select the dropdown button 
	dropdown1 = driver.find_element(:xpath, "//select[@id='days']")
	days = Selenium::WebDriver::Support::Select.new(dropdown1)
	days.select_by(:value, '31')

	dropdown2 = driver.find_element(:xpath, "//select[@id='months']")
	months = Selenium::WebDriver::Support::Select.new(dropdown2)
	months.select_by(:value, '1')	

	dropdown3 = driver.find_element(:xpath, "//select[@id='years']")
	years = Selenium::WebDriver::Support::Select.new(dropdown3)
	years.select_by(:value, '1990')	

	driver.find_element(:xpath,"//input[@id='newsletter']").click
	driver.find_element(:xpath,"//input[@id='optin']").click

	driver.find_element(:xpath,"//input[@id='firstname']").send_keys("dedya")
	driver.find_element(:xpath,"//input[@id='lastname']").send_keys("testinga")
	driver.find_element(:xpath,"//input[@id='company']").send_keys("testing company")
	driver.find_element(:xpath,"//input[@id='address1']").send_keys("jalan mawar no 5a")
	driver.find_element(:xpath,"//input[@id='address2']").send_keys("depok - sleman")
	driver.find_element(:xpath,"//input[@id='city']").send_keys("Sleman Sembada")

	dropdown = driver.find_element(:xpath, "//select[@id='id_state']")
	state = Selenium::WebDriver::Support::Select.new(dropdown)
	state.select_by(:value, '9')	

	driver.find_element(:xpath,"//input[@id='postcode']").send_keys("90210")

	dropdown = driver.find_element(:xpath, "//select[@id='id_country']")
	country = Selenium::WebDriver::Support::Select.new(dropdown)
	country.select_by(:value, '21')	

	driver.find_element(:xpath,"//textarea[@id='other']").send_keys("this is additiona info")

	driver.find_element(:xpath,"//input[@id='phone']").send_keys("+01-254689-4585")
	driver.find_element(:xpath,"//input[@id='phone_mobile']").send_keys("087487547855")
	driver.find_element(:xpath,"//input[@id='alias']").send_keys("adddress1")
	#driver.find_element(:xpath,"").send_keys("")
end

And("I click on register button") do
	sleep(5)
	driver.find_element(:xpath,"//button[@id='submitAccount']/span").click
end

Then("I should redirected to my new account page") do
	sleep(5)
	account = driver.find_element(:xpath,"//div[@id='center_column']/h1")
	if account.text == "MY ACCOUNT"
	driver.execute_script( "window.open()" )
	#Use the newest window
	driver.switch_to.window( driver.window_handles.last )
	driver.navigate.to "http://automationpractice.com"
	end
end

# tags @valid-login
Given(/^I open automationpractice.com login page 2nd$/) do
	driver.get "http://automationpractice.com/index.php?controller=authentication&back=my-account"
	sleep(2)
end

When(/^I enter a valid credential$/) do
	driver.find_element(:xpath,"//input[@id='email']").send_keys("dedy@dedy.com")
	driver.find_element(:xpath,"//input[@id='passwd']").send_keys("123456")
end

And(/^I click on sign in button$/) do
	driver.find_element(:xpath,"//button[@id='SubmitLogin']/span").click
end

Then(/^I am allowed to login$/) do
	account = driver.find_element(:xpath,"//div[@id='center_column']/h1")
	if account.text == "MY ACCOUNT"
	driver.quit
	end
end

#tags@invalid-login
Given(/^I open automationpractice.com login page 3rd$/) do
	driver.get "http://automationpractice.com/index.php?controller=authentication&back=my-account"
	sleep(2)
end

When(/^I enter an invalid credential$/) do
	driver.find_element(:xpath,"//input[@id='email']").send_keys("iniinvalidlogin@dedy.com")
	driver.find_element(:xpath,"//input[@id='passwd']").send_keys("123456")
	sleep(5)
end

And(/^I click on sign in button with invalid credential$/) do
	driver.find_element(:xpath,"//button[@id='SubmitLogin']/span").click
	sleep(2)
end

Then(/^I am not allowed to login$/) do
	sleep(5)
	alert = driver.find_element(:xpath,"//div[@id='center_column']/div/ol/li")
	if alert.text == "Authentication failed."
	driver.quit
	end
end

#tags@purchase-invalid
Given(/^I open automationpractice.com as unregistered user$/) do
	driver.get "http://automationpractice.com/index.php"
	sleep(2)
end

When("I purchase item as unregistered user") do
	sleep(2)
	driver.find_element(:xpath,"//img[@alt='Faded Short Sleeve T-shirts']").click
	driver.find_element(:xpath,"//p[@id='add_to_cart']/button/span").click
	sleep(10)
	driver.find_element(:xpath,"//div[@id='layer_cart']/div/div[2]/div[4]/a").click
	#driver.find_element(:xpath,"").send_keys("")
	#driver.find_element(:xpath,"").send_keys("")
end

And("I click checkout") do
	sleep(5)
	driver.find_element(:xpath,"//div[@id='center_column']/p[2]/a/span").click
end

Then(/^I am not allowed to purchase$/) do
	sleep(5)
	alert = driver.find_element(:xpath,"//div[@id='center_column']/h1")
	if alert.text == "AUTHENTICATION"
	driver.quit
	end
end

#tags@purchase-valid
Given("I open automationpractice.com as a registered user") do
	driver.get "http://automationpractice.com/index.php?controller=authentication&back=my-account"
	sleep(2)
	driver.find_element(:xpath,"//input[@id='email']").send_keys("dedy@dedy.com")
	driver.find_element(:xpath,"//input[@id='passwd']").send_keys("123456")
	driver.find_element(:xpath,"//button[@id='SubmitLogin']/span").click
	sleep(10)
	driver.navigate.to "http://automationpractice.com/index.php"
end

When("I purchase item as registered user") do
	sleep(2)
	driver.find_element(:xpath,"//img[@alt='Faded Short Sleeve T-shirts']").click
	driver.find_element(:xpath,"//p[@id='add_to_cart']/button/span").click
	sleep(10)
	driver.find_element(:xpath,"//div[@id='layer_cart']/div/div[2]/div[4]/a").click #
	sleep(5)
	driver.find_element(:xpath,"//div[@id='center_column']/p[2]/a/span").click
	sleep(5)
	driver.find_element(:xpath,"//div[@id='center_column']/form/p/button/span").click
	sleep(5)
	driver.find_element(:xpath,"//input[@id='cgv']").click
	driver.find_element(:xpath,"//form[@id='form']/p/button/span").click
	sleep(5)
	driver.find_element(:xpath,"//a[@href='http://automationpractice.com/index.php?fc=module&module=bankwire&controller=payment']").click
	sleep(5)
	driver.find_element(:xpath,"//p[@id='cart_navigation']/button/span").click
end

Then(/^I am allowed to purchase$/) do
	sleep(5)
	alert = driver.find_element(:xpath,"//div[@id='center_column']/div/p/strong")
	if alert.text == "Your order on My Store is complete."
	driver.quit
	end
end