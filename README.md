<h1>Arquitetura do projeto</h1>
=================================

<h3>Configurando sua máquina</h3>
==================================

Necessário instalar:
-----------------------

*	Ruby for Windows: linguagem de programação utilizada nos testes.
*	Cmder for Windows: Sistema que trás as funcionalidades bash (Terminal) para o Windows.
*	DevKit: Kit de ferramentas que o sistema operacional precisa para que o desenvolvimento funcione.
*	Chromedriver: Driver do navegador que será utilizado na automação. Disponível no site do <https://sites.google.com/a/chromium.org/chromedriver/downloads>
*	Atom: Editor de texto com funções úteis para escrever o código da automação de testes.


<h3>Configurando o ambiente de automação de testes Web</h3>
------------------------------------------------------------

Para que sua automação possa ser realizada é necessário instalar alguns recursos, conforme será descrito abaixo:

Windows
-------
1. Instalando o Console do Cmder
*	Baixe em: <https://github.com/cmderdev/cmder/releases/download/v1.3.2/cmder.zip> .
*	Descompactar na pasta C:\tools\Cmder.
● Selecione o cmder.exe e arrastar até sua barra de ferramentas do Windows para criar um
atalho.
● Executar o cmder.exe.
2. Instalando o Ruby para Windows
● baixe em: http://rubyinstaller.org/downloads/ .
● Executar o arquivo baixado e seguir as instruções clicando em ‘next’
● Selecionar os 3 checkbox exibidos e continuar a dar ‘next’ até o ‘finish’.
● No Console do Cmder, digite o comando ruby –v , der tudo certo você vai ver a versão
instalada.
3. Instalando Devkit
● Baixe em:
http://dl.bintray.com/oneclick/rubyinstaller/DevKit-mingw64-64-4.7.2-20130224-1432-sfx.
exe .
● Acesse o diretório C:\Ruby23-x64.
● Crie uma pasta chamada devKit e coloque o arquivo baixado dentro dessa pasta.
● Clique duas vezes no arquivo para que ele descompate os arquivos na pasta que foi criada.
● No Console do Cmder, digite os comandos:
> cd C:\Ruby23-x64\devkit
> ruby dk.rb init
> ruby dk.rb install
4. Alterando os sources do rubygems
O Rubygems precisa de uma atualização de certificado de sergurança para permitir utilizar com https,
e para não precisar atualizar isso, passamos a utilizar então o repositório de gems em http, fazendo o
seguinte:
● No Console do Cmder, digite o comando:
> gem sources -a http://rubygems.org/
> gem sources -r https://rubygems.org/
5. Instalando o bundler
● No Console do Cmder, digite o comando:
> gem install bundler
6. Instalando o chromedriver
● Baixe em: http://chromedriver.storage.googleapis.com/index.html?path=2.25/ .
● Descompacte o arquivo dentro da pasta C:\Ruby23-x64\bin.

Para a automação de testes algumas gems do
Ruby são essenciais, sendo elas:
• Cucumber
• Capybara
• Selenium-webdriver
Para manter o controle das Gems usadas no
projeto, adicione no arquivo Gemfile e serão
instaladas de uma só vez.
Com o arquivo Gemfile configurado, utiliza-se
a gem bundler para instalação das
dependências listadas:
$ cd ~\Documents\Projects\Dojo
$ gem install bundler
$ bundle

Aprendendo a usar o env.rb
• O env.rb inicializa
configurações do teste, tal
como o navegador que deve ser
utilizado.
• O require sob em memória os
arquivos das Gems necessárias.

Gem SitePrism

O SitePrism é uma gem do ruby que facilita no mapeamento ou organização de todos os elementos que serão utilizados no projeto de automação. Facilitando o uso do famoso padrão de projeto chamado de Page Object.

Sua semântica/sintaxe é tão legível quanto o Capybara. (que nós já conhecemos)

Utilizando o SitePrism...
Para o funcionamento pleno do SitePrism, precisamos fazer as seguintes alterações em nosso projeto.
GemFile
gem 'site_prism', '~> 2.9’
Env
require 'site_prism’

Dúvidas: https://rubygems.org/

Gem Faker 

O Faker é um gem do Ruby que gera dados aleatórios (“fakes”) para diversos tipos de necessidades, como por exemplo:
Nome
Sobrenome
Cidade
Estado
Telefone ...

Para o funcionamento pleno do Faker, precisamos fazer as seguintes alterações em nosso projeto.
GemFile
gem ’faker'
Env
require ’faker’
Dúvidas: https://rubygems.org/


Hooks.rb...
O termo hook do inglês significa gancho. E trazendo para o nosso contexto de automação, o arquivo hooks.rb é quem armazena todo o código que fará uma ação em momentos que serão estabelecidos através deste arquivo.
Por exemplo, dois momentos em que podemos acrescentar ações antes da nossa automação iniciar, é o período antes de iniciar um teste e o período após finalizar o teste.
O Ruby entende estes momentos quando utilizamos as seguintes palavras chaves:
Before
After

Tags...
Utilizamos a tag para diferenciar os cenários por grupos, funcionalidades ou etapas de testes. As tags são inseridas na linha de cima do nome do cenário. 
No terminal, quando quisermos rodar os cenários que estão nomeados com tags, basta utilizarmos o seguinte comando:

Cucumber –-tag @nome_da_tag
Ou 
Cucumber –t @nome_da_tag

Esse comando rodará todos os cenários que tiverem a tag.




