<h1>Arquitetura do projeto</h1>

Configurando sua máquina
-------------------------
Necessário instalar:
-----------------------

*	Ruby for Windows: linguagem de programação utilizada nos testes.
*	Cmder for Windows: Sistema que trás as funcionalidades bash (Terminal) para o Windows.
*	DevKit: Kit de ferramentas que o sistema operacional precisa para que o desenvolvimento funcione.
*	Chromedriver: Driver do navegador que será utilizado na automação. Disponível no site do <https://sites.google.com/a/chromium.org/chromedriver/downloads>.
*	Atom: Editor de texto com funções úteis para escrever o código da automação de testes.


Configurando o ambiente de automação de testes Web
------------------------------------------------------------

Para que sua automação possa ser realizada é necessário instalar alguns recursos, conforme será descrito abaixo:

Windows
--------

<h3>1. Instalando o Console do Cmder</h3>

*	Baixe em: <https://github.com/cmderdev/cmder/releases/download/v1.3.2/cmder.zip> .
*	Descompactar na pasta C:\Cmder.
*	Selecione o cmder.exe e arrastar até sua barra de ferramentas do Windows para criar um atalho.
*	Executar o cmder.exe.

<h3>2. Instalando o Ruby para Windows de acordo com a versão do seu sistema operacional e arquitetura x86 (32bits) ou x64 (64bits)</h3>

*	Baixe em: <http://rubyinstaller.org/downloads/>.
*	Executar o arquivo baixado e seguir as instruções clicando em ‘next’.
* 	Selecionar os 3 checkbox exibidos e continuar a dar ‘next’ até o ‘finish’.
*	No Console do Cmder, digite o comando ruby –v , se a instalação estiver correta aparecerá a versão instalada.

<h3>3. Instalando Devkit</h3>	

*	Baixe em (x86): <https://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-32-4.7.2-20130224-1151-sfx.exe>.
* 	Baixe em (x64): <http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.exe>.
*	Acesse o diretório C:\Ruby23-x64.
*	Crie uma pasta chamada devkit e coloque o arquivo baixado dentro dessa pasta.
*	Clique duas vezes no arquivo para que ele descompate os arquivos na pasta que foi criada.
*	No Console do Cmder, digite os comandos:

```bash
cd/
cd C:\Ruby23-x64\devkit
ruby dk.rb init
ruby dk.rb install
```

<h3>4. Alterando os sources do rubygems</h3>

O Rubygems precisa de uma atualização de certificado de sergurança para permitir utilizar com https,
e para não precisar atualizar isso, passamos a utilizar então o repositório de gems em http, fazendo o
seguinte:
*	No Console do Cmder, digite o comando:
```bash
gem sources -a http://rubygems.org/
gem sources -r https://rubygems.org/
```

<h3>5. Instalando o bundler</h3>

No Console do Cmder, digite o comando:
```bash
gem install bundler
```

<h3>6. Instalando o chromedriver</h3>

Baixe em: <https://sites.google.com/a/chromium.org/chromedriver/downloads> .
*	Descompacte o arquivo dentro da pasta C:\Ruby23-x64\bin.

E pronto, ambiente configurado.

Clonando o repositório do git para execução dos teste
------------------------------------------------------

<h3>Selecionando o destino para o clone do projeto</h3>

*	Navegue no Cmder até a pasta em que você achar mais apropriada para ser feito o clone do projeto, como exemplo vou utilizar a pasta projetos dentro de C:.
```bash
cd/
cd projetos
```

<h3>Clonando o repositório </h3>

*	No Console do Cmder, digite o comando:

````bash
git clone https://github.com/felipeqa/Walmart_Projeto_de_Automacao_de_Testes_com_Cucumber.git

````
Como é possível ver, a estrutura do comando é "git clone [endereço do repositório] .

Feito isso, temos um clone do projeto para que possamos trabalhar e executar os testes automatizados.


Automação de Testes
--------------------

Para a automação de testes algumas gems do Ruby são essenciais, sendo elas:
*	Cucumber
*	Capybara
*	Selenium-webdriver

Para manter o controle das Gems usadas no projeto, adicione no arquivo Gemfile e serão instaladas de uma só vez.
Com o arquivo Gemfile configurado, utiliza-se a gem bundler para instalação das dependências listadas:
```bash
cd C:\Projetos\Walmart_Projeto_de_Automacao_de_Testes_com_Cucumber
gem install bundler
bundle
```

O resultado é:

![Passo 1](readme_images/cmder_print.jpg?raw=true)


<h3>Aprendendo a usar o env.rb</h3>

*	O env.rb inicializa configurações do teste, tal como o navegador que deve ser utilizado.
*	O require sob em memória os arquivos das Gems necessárias.

<h3>Gem SitePrism</h3>

O SitePrism é uma gem do ruby que facilita no mapeamento ou organização de todos os elementos que serão utilizados no projeto de automação. Facilitando o uso do famoso padrão de projeto chamado de Page Object.
Sua semântica/sintaxe é tão legível quanto o Capybara.

<h3>Gem Faker</h3> 

O Faker é um gem do Ruby que gera dados aleatórios (“fakes”) para diversos tipos de necessidades, como por exemplo:
*	Nome
*	Sobrenome
*	Cidade
*	Estado
*	Telefone

Para maiores informações <https://github.com/stympy/faker>

<h3>Hooks.rb</h3>

O termo hook do inglês significa gancho. E trazendo para o nosso contexto de automação, o arquivo hooks.rb é quem armazena todo o código que fará uma ação em momentos que serão estabelecidos através deste arquivo.
Por exemplo, dois momentos em que podemos acrescentar ações em nossa automação é:

*	Antes da nossa automação iniciar a execução, que é o período antes de um cenário de teste iniciar a execução.
*	E após o termino da execução de um cenário, período após finalizar um cenário de teste.

O Ruby entende estes momentos quando utilizamos as seguintes palavras chaves:

*	Before
*	After

<h3>Utilizando Tags</h3>

Utilizamos a tag para diferenciar os cenários por grupos, funcionalidades ou etapas de testes. As tags são inseridas na linha de cima do nome do cenário.
No terminal, quando quisermos rodar os cenários que estão nomeados com tags, basta utilizarmos o seguinte comando:

Cucumber –-tag @nome_da_tag
Ou 
Cucumber –t @nome_da_tag

Esse comando rodará todos os cenários que tiverem a tag.

Executando os testes automatizados
-----------------------------------

Para executar o testes automatizados usaremos alguns comandos a partir da pasta raiz do nosso projeto.

*	Para execução de todos os cenários implementados utilizamos o seguinte código:
````bash
cucumber
````

Resultado:

![Passo 2](readme_images/cucumber.png?raw=true)

Todos os testes são executados.

*	Para execução de algum cenário específico utilizamos as tags:
````bash
cucumber -t @automatizadologoff
````
O teste demarcado com a tag é executado.

Resultado:

![Passo 3](readme_images/logoff.png?raw=true)

*	Para execução de todos os cenários e gerar um report em html, utilizamos o seguinte código:
````bash
cucumber --format html --out report.html
````

Resultado:

![Passo 3](readme_images/report.png?raw=true)

Na pasta raiz do projeto é gerado um arquivo HTML com o report dos cenários de testes.

Basta abrir no seu navegador e visualizar o resultado.

![Passo 4](readme_images/report1.png?raw=true)

Report criado com screenshot ao final da execução de cada cenário.

Contato
-------
Estou aberto a sugestões, elogios, críticas ou qualquer outro tipo de comentário. 

*	E-mail: felipe_rodriguesx@hotmail.com.br
*	Linkedin: <https://www.linkedin.com/in/luis-felipe-rodrigues-de-oliveira-2b056b5a/>

Licença
-------
Esse código é livre para ser usado dentro dos termos da licença MIT license










