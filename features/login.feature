#encoding: utf-8
#language: pt
@login
Funcionalidade: Cadastro de Fans de Star Wars
Eu como fan de star wars
Quero acessar a página Star Wars 
Para realizar o meu cadastro

Cenário: Preencher Cadastro Completo de fan de Star War
	Dado que eu esteja na pagina de login
	Quando eu preencher todas as informações
	Então eu verifico que foi enviado com sucesso