#Cenário 1
#Testar resultado API de CEP dos Correios válido

Dado(/^que eu queira saber os detalhes do endereço de um cep válido "([^"]*)"$/) do |cepValido|
	@response = HTTParty.get("http://correiosapi.apphb.com/cep/#{cepValido}")
end

Quando(/^eu receber a resposta da API$/) do
	puts @response.body
	puts @response.code
end

Então(/^devo validar cep, tipo de logradouro, logradouro, bairro, cidade,estado e o response code\.$/) do
	puts @response.code == 200 && @response['cep'] == '06342080' && @response['tipoDeLogradouro'] == 'Rua' && @response['logradouro'] == 'Maria José Ferreira' && @response['bairro'] == 'Jardim Helena' && @response['cidade'] == 'Carapicuíba' && @response['estado'] == 'SP' 
end
###########################################################################################################################################
#Cenário 2
#Testar resultado API de CEP dos Correios válido

Dado(/^que eu queira saber os detalhes do endereço de um cep inválido "([^"]*)"$/) do |cepInvalido|
  	@response = HTTParty.get("http://correiosapi.apphb.com/cep/#{cepInvalido}")
end

Então(/^devo validar mensagem de erro e o response code\.$/) do
	puts @response.code == 404 && @response['message'] == 'Endereço não encontrado!'	
end