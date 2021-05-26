aula 1. Iniciando o cuso da QANINJA "capybara: automatize testes para aplicações web com ruby";
aula 2. Ininciamento o custo pede a instalação de VSCODE, CMDer, Ruby;
aula 3. Instalação do capybara(biblioteca ruby, usado para testar aplicações web, criado com base no
webdriver, ele é um framework de automação, mantido pela comunidade ruby, ele tem uma DSL simples
tambem utilizado no Selenium);
 3.1. dentro da pasta do projeto execute: bundle init (Para criar a estrutura), este comando irá
 criar na sua pasta um arquivo chamado Gemfile
 3.2. Mantenha no arquivo apenas a linha: source "https://rubygems.org"
 3.3. Inclua abaixo do linha anterios as gens que serão utilizadas no nosso projeto
 é por este arquivo e informação que iremos instalar esses recursos:
    gem 'capybara' -> Será nosso framework
    gem 'rspec' -> nos facilita com a criação de estrutura de testes
    gem 'selenium-webdriver' -> é a base do capybara, que roda sobre o selenium
    gem 'ffi' -> fornece recursos externos utilizados pelo capybara
 3.3. Iniciar o projeto:
   rspec --init 
   vai criar a estrutura:   
     create   .rspec
     create   spec/spec_helper.rb