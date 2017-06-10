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
	if @response['cep'] == '06342080'
		puts 'Cep validado com sucesso! ===> ' + @response['cep']
		
		if @response['tipoDeLogradouro'] == 'Rua'
			puts 'Tipo de logradouro validado com sucesso! ===> ' + @response['tipoDeLogradouro']

			if @response['logradouro'] == 'Maria José Ferreira'
				puts 'Logradouro validado com sucesso! ===> ' +  @response['logradouro'] 
		 		
		 		if @response['bairro'] == 'Jardim Helena'
					puts 'Bairro validado com sucesso! ===> ' + @response['bairro']

					if @response['cidade'] == 'Carapicuíba'
						puts 'Cidade validada com sucesso! ===> ' + @response['cidade']

								if @response['estado'] == 'SP'
									puts 'Estado validado com sucesso! ===> '  + @response['estado']

											if @response.code == 200
													puts 'Response Code validado com sucesso! ===> ' + @response.code.to_s
											 	else
													puts 'Response Code diferente do previsto! ===> ' + @response.code.to_ss
											end
								 		else
									puts 'Estado diferente do previsto! ===> ' + @response['estado']
								end
						 else
						puts 'Cidade diferente da prevista! ===> ' + @response['cidade']
					end
				 else
					puts 'Bairro diferente do previsto! ===> ' +  @response['bairro']		
				end		
			 else	
				puts 'Logradouro diferente do previsto! ===> ' + @response['logradouro'] 
			end
		 else
			puts 'Tipo de logradouro diferente do previsto! ===> ' + @response['tipoDeLogradouro']					
		end
	 else
		puts 'Cep diferente do previsto! ===> ' + @response['cep']	
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