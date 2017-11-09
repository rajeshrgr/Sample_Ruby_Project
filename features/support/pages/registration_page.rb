require 'page-object'

class RegistrationPage
	include PageObject
	page_url "www.demoqa.com"
	link :open, :href => 'http://demoqa.com/registration/'
	text_field(:fname, :id => 'name_3_firstname')
	text_field(:lname, :id => 'name_3_lastname')
	radio_button(:quite, :xpath => "//*[@id='pie_register']/li[2]/div/div/input[1]")
	def hobby
		a = @browser.elements(:xpath=>"//input[@type='checkbox']").size
			for z in 1..a
	 		c = @browser.checkbox(:xpath => "//input[@type='checkbox'][#{z}]")
			c.click if c.exists?

		end
	end

	select_list(:nation, :id => 'dropdown_7')
	select_list(:month, :id => 'mm_date_8')
	select_list(:day, :id => 'dd_date_8')
	select_list(:year, :id => 'yy_date_8')
	text_field(:phone, :id => 'phone_')
	text_field(:nicname, :id => 'username')
	text_field(:mailid, :id => 'email_1')
	text_area(:description, :id => 'description')
	text_field(:code, :id => 'password_2')
	text_field(:recode, :id => 'confirm_password_password_2')
	button(:hit, :name => 'pie_submit')


	def check
		confim_msg = @browser.p(:xpath => "//*[@id='post-49']/div/p").text
		if confim_msg.include? "Thank you for your registration"
			p "#{confim_msg}"
		else
			raise "Failed..............."
		end
	end
end