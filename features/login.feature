#encoding: utf-8
#language: pt

Funcionalidade: Acessar Portal Login Page
Eu usuário do portal
Quero fazer meu login 
Para que eu possa consultar XPTO informações

Contexto: Abrir paginal de login
	Dado que eu esteja na pagina inicial de login

@loginmanual @front
Cenário: Acessar Login Page
	Quando eu preencher meus dados e acessar
	Então eu verifico que o acesso foi feito com sucesso

@logoffmanual @front
Cenário: Acessar Login Page
	Quando eu preencher meus dados e acessar
	E fazer o logoff do sistema
	Então eu verifico que o logoff foi feito com sucesso

@automatizadologin @front
Cenário: Login totalmente automatizado
	Quando eu preencher meu usuário "tomsmith" e senha "SuperSecretPassword!"
	Então eu verifico que o acesso foi feito com sucesso

@automatizadologoff @front
Cenário: Logoff totalmente automatizado
	Quando eu preencher meu usuário "tomsmith" e senha "SuperSecretPassword!"
	E fazer o logoff do sistema
	Então eu verifico que o logoff foi feito com sucesso

@negativo @front
Cenário: Acessar Login page com usuário inválido
	Quando eu preencher um usuário inválido com senha aleatória
	Então eu verifico que o usuário não possui acesso
