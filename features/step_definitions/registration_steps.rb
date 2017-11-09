require 'faker'

Given(/^I am on demoqa home page$/) do
	visit RegistrationPage
end

When(/^I click on registration$/) do
	on RegistrationPage do |navigate|
		navigate.open
		sleep 2
	end
end

When(/^I enter all the valid details$/) do
	on RegistrationPage do |move|
		move.fname="koustubha"
		move.lname="gowda"
		move.select_quite
		move.hobby
		move.nation="India"
		move.month="5"
		move.day="20"
		move.year="2012"
		move.phone="9733628102"
		a = Faker::Name.name 
		move.nicname = a
		p "#{a}"
		move.mailid = Faker::Internet.email
		move.description="reservation tickets"
		move.code="Reserve12@"
		move.recode="Reserve12@"
	end
end

When(/^I click on submit button$/) do
	on RegistrationPage do |start|
		start.hit
		sleep 2
	end
end

Then(/^I should get the proper message$/) do
	on RegistrationPage do |verify|
		verify.check
	end
end
