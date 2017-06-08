class Login < SitePrism::Page

	element :user_name, '#username'
	element :password, '#password'
	element :login_button, :xpath, '//*[@id="login"]/button'

end
