class FazerLogin < SitePrism::Page

	set_url 'https://the-internet.herokuapp.com/login'

def  acessar
	@Login = Login.new
	puts "Olá usuário, tudo bem? Por favor, insira o user name tomsmith, ou se preferir copie daqui ==>  tomsmith  "
	user = gets.strip
	@Login.user_name.set user
	puts "Ok #{user}, agora iremos colocar a senha SuperSecretPassword! ou se preferir copie daqui ==>    SuperSecretPassword!   "
	senha = gets
	@Login.password.set senha.strip
	@Login.login_button.click
end

end