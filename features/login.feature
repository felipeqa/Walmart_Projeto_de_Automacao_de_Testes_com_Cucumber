#encoding: utf-8
#language: pt
@login
Funcionalidade: Cadastro_de_Fans
Eu como fan de star wars
Quero acessar a página Star Wars 
Para realizar o meu cadastro

Cenário: Preencher_Cadastro
	Dado que eu esteja na pagina de login
	Quando eu preencher todas as informações
	Então eu verifico que foi enviado com sucesso