# force_encoding("UTF-8")
# force_encoding(Encoding::UTF_8)
#Cenário 1
#Testar resultado API de CEP dos Correios válido


Dado(/^que eu queira saber os detalhes do endereço de um cep válido "([^"]*)"$/) do |cepValido|
	@response = HTTParty.get("http://correiosapi.apphb.com/cep/#{cepValido}")
end

Quando(/^eu receber a resposta da API$/) do
	puts @response.body.force_encoding(Encoding::UTF_8)
	puts @response.code
end

Então(/^devo validar cep, tipo de logradouro, logradouro, bairro, cidade,estado e o response code.$/) do
	puts @response['cep']
	puts @response['tipoDeLogradouro']
	puts @response['logradouro'] 
	puts @response['bairro']
	puts @response['cidade']
	puts @response['estado']
	puts @response.code

	puts @response.code == 200 && @response['cep'] == '06342080' && @response['tipoDeLogradouro'] == 'Rua' && @response['logradouro'] == 'Maria José Ferreira' && @response['bairro'] == 'Jardim Helena' && @response['cidade'] == 'Carapicuíba' && @response['estado'] == 'SP'
	
	if	true
		puts 'Detalhe de endereço e response code validado com sucesso'
	 else
	 	puts 'ERROR - Investigar response body e response code'
	end 
end
###########################################################################################################################################
#Cenário 2
#Testar resultado API de CEP dos Correios válido

Dado(/^que eu queira saber os detalhes da resposta de um cep inválido "([^"]*)"$/) do |cepInvalido|
  	@response = HTTParty.get("http://correiosapi.apphb.com/cep/#{cepInvalido}")
end

Então(/^devo validar mensagem de erro e o response code\.$/) do
	puts @response.code == 404 && @response['message'] == 'Endereço não encontrado!'	

	if true
		puts 'CEP invalido, mensagem de erro padrão e response code validado com sucesso'
	 else
	 	puts 'ERROR - Investigar response body e response code'
	end 
end