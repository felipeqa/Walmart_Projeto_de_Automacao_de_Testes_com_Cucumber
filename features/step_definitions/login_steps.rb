
Dado(/^que eu esteja na pagina inicial de login$/) do
  @FazerLogin = FazerLogin.new
  @FazerLogin.load
end

Quando(/^eu preencher meus dados e acessar$/) do
  @FazerLogin.acessar
end

Então(/^eu verifico que o acesso foi feito com sucesso$/) do
  assert_text ' You logged into a secure area!'
end

Quando(/^fazer o logoff do sistema$/) do
  find(:xpath, '//*[@id="content"]/div/a').click
end

Então(/^eu verifico que o logoff foi feito com sucesso$/) do
  assert_text ' You logged out of the secure area!'
end

Quando(/^eu preencher meu usuário "([^"]*)" e senha "([^"]*)"$/) do |usuario, senha|
  @LoginAutomatizado = LoginAutomatizado.new
  @LoginAutomatizado.automatizado usuario, senha
end

Quando(/^eu preencher um usuário inválido com senha aleatória$/) do
  @LoginInvalido = LoginInvalido.new
  @LoginInvalido.usuario_invalido
end

Então(/^eu verifico que o usuário não possui acesso$/) do
  assert_text 'Your username is invalid!'
end

Quando(/^eu preencher um usuário valido$/) do
  @SenhaInvalida = SenhaInvalida.new
  @SenhaInvalida.senha_invalida
end

Então(/^eu verifico que a senha está incorreta$/) do
   assert_text 'Your password is invalid!'
end
