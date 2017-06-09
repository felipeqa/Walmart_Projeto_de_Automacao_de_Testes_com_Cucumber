class FazerLogin < SitePrism::Page
	set_url 'https://the-internet.herokuapp.com/login'

  def  acessar
	@Login = Login.new
	puts "Olá usuário, tudo bem? Por favor, insira o user name tomsmith, ou se preferir copie daqui ==>  tomsmith  "
	user = STDIN.gets.strip
	@Login.user_name.set user
	puts "Ok #{user}, agora iremos colocar a senha SuperSecretPassword! ou se preferir copie daqui ==>    SuperSecretPassword!   "
	senha = STDIN.gets.strip
	@Login.password.set senha
	@Login.login_button.click
  end
end

class LoginInvalido < SitePrism::Page
  def  usuario_invalido
	@Login = Login.new
	@Login.user_name.set Faker::StarWars.character
	@Login.password.set Faker::Name.name
	@Login.login_button.click
  end
end

class LoginAutomatizado < SitePrism::Page
  def  automatizado usuario, senha
	@Login = Login.new
	@Login.user_name.set usuario
	@Login.password.set senha
	@Login.login_button.click
  end
end