class FazerLogin < SitePrism::Page
	set_url 'https://the-internet.herokuapp.com/login'

  def  acessar
	@Login = Login.new

	user = 'Sem user'
	while user != 'tomsmith'

	puts 'Olá usuário, tudo bem? Por favor, utilize o username tomsmith, ou se preferir copie daqui ==>   tomsmith    '
	user = STDIN.gets.strip

		if user != 'tomsmith'
			puts "ERROR, você digitou #{user}! Username incorreto, não esqueça que o usuário correto é tomsmith, vamos tentar novamente?"
			sleep 2
		end	
	end

	@Login.user_name.set user

	senha = 'sem senha'
	while senha != 'SuperSecretPassword!'

	puts "Ok #{user}, agora utilize a senha SuperSecretPassword! ou se preferir copie daqui ==>    SuperSecretPassword!    <== e não esqueça da !!!!!  "
	senha = STDIN.gets.strip

		if senha != 'SuperSecretPassword!'
			puts "ERROR, você digitou #{senha}! Senha incorreta, não esqueça que a senha correta é SuperSecretPassword!, vamos tentar novamente?"
			sleep 2 
		end	
	end

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