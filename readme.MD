### Assessment Test, september 3rd,2018
This repository contains:
1. Test Scnario and Test Cases for testing automationpractice.com
2. Bugs on automationpractice.com
3. Ruby-Selenium-Cucumber-Gherkin test script
4. Katalon Project files for testing automationpractice.com

### Ruby-Selenium-Cucumber-Gherkin test script
Requirements:
1. Ruby v2.5.1
2. Selenium-webdriver, latest version
3. Cucumber, latest version

Instructions if you want to run the script :
1. Install ruby
2. Install gem cucumber
3. Install gem selenium-webdriver
4. Execute test based on tags, since it was intended that way :) , eg: *$ cucumber --tags @register*
5. Tags :@register, @valid-login, @invalid-login, @purchase-invalid, @purchase-valid
6. Generate report using built in command, eg: *cucumber --tags @purchase-valid --format html --out purchase-valid-report.html*

For katalon project files, just clone and extract into your katalon project folder, and then run the script from inside katalon Studio, I have never tried it, hope it works :) .

### Links
1. https://www.katalon.com/
2. https://cucumber.io/





