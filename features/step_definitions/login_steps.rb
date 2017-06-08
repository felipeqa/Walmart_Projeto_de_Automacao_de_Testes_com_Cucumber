Dado(/^que eu esteja na pagina de login$/) do
  @FazerLogin = FazerLogin.new
  @FazerLogin.load
end

Quando(/^eu preencher todas as informações$/) do

@FazerLogin.acessar

end

Então(/^eu verifico que foi enviado com sucesso$/) do
  assert_text ' You logged into a secure area!'
end