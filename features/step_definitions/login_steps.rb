Dado(/^que eu esteja na pagina de login$/) do
  @FazerLogin = FazerLogin.new
  @FazerLogin.load
end

Quando(/^eu preencher todas as informações$/) do

  find('#username').set.gets(user)

end

Então(/^eu verifico que foi enviado com sucesso$/) do
  pending # Write code here that turns the phrase above into concrete actions
end