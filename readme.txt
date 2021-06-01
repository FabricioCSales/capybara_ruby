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
    Dentro da nossa pagina do projeto
    Criar arquivo de teste para verificar se rspec esta funcionando
      describe "Meu primeiro script" do
        it "visitar a página" do
          puts "acessando a pagina"
        end
      end
      Describe é  suite de testes, sempre é fechada com do end, e entre os dois vai conter os testes
      it sera o bloco de teste criado
    Depois de salvar o arquivo, execute no terminal o compando RSPEC e a saida deve ser:
      λ rspec
      acessando a pagina
      .

      Finished in 0.0881 seconds (files took 2.56 seconds to load)
      1 example, 0 failures
  3.4. Utilizaremos agora comandos capybara para automatizar os testes pois o rspec não interage com as paginas externas
      Para isso, devemos parametrizar para que o rspec reconheça os comandos capybara
      Acesse o arquivo spec_helper e retire todos os textos comentados.
      Inclua no inicio do arquivo as importações necessárias
        require "capybara"
        require "capybara/rspec"
        require "selenium-webdriver"
      
      Ainda no arquivo ajuste esta etapa do código:
         config.shared_context_metadata_behavior = :apply_to_host_groups

         config.include Capybara::DSL
         end                                            
      Essa configuração trara para o rspec todos os métodos, funções e recursos do capybara

      Inclua a nova configuração abaixo, do capybara, para definir o browser padrão para execução dos teste
        Capybara.configure do |config|
          config.default_driver = :selenium_chrome
        end
  3.5 Incluir comando capybara no arquivo de teste:
      describe "Meu primeiro script" do
         it "visitar a página" do
            visit "https://training-wheels-protocol.herokuapp.com"
            sleep 4
          end
      end
    Ao executar rspec, o sistema apresentara um erro com a mensagem: (Caso não tenha o crhome webdriver instalado na máquina
    )
      λ rspec                                                                                             
       F                                                                                                   
                                                                                                     
        Failures:                                                                                           
                                                                                                            
          1) Meu primeiro script visitar a página                                                           
             Failure/Error: visit "https://training-wheels-protocol.herokuapp.com"                          
                                                                                                            
             Selenium::WebDriver::Error::WebDriverError:                                                    
               Unable to find chromedriver. Please download the server from                                 
               https://chromedriver.storage.googleapis.com/index.html and place it somewhere on your PATH.  
               More info at https://github.com/SeleniumHQ/selenium/wiki/ChromeDriver.                       
             # ./spec/hello_spec.rb:3:in `block (2 levels) in <top (required)>'                             
                                                                                                            
        Finished in 1.3 seconds (files took 4.34 seconds to load)                                           
        1 example, 1 failure                                                                                
                                                                                                            
       Failed examples:                                                                                    
                                                                                                           
       rspec ./spec/hello_spec.rb:2 # Meu primeiro script visitar a página       

      Faça o download do arquivo indicado no proprio erro. Procure a versão compativel com o seu navegador
      Depois de baixar, salvo o arquivo .exe dentro de C:\windows, por exemplo. Pois o mesmo deve esta no path do seu SO

      Depois execute o RSPEC novamente.. Nesse momento o Chrome deve estar instalado no PC. 
      Se tudo ocorrer bem, deverá abrir o Chrome e abrir o endereço indicado no teste
  
** NOTE QUE NESSE INSTANTE VOCE ESTA USANDO O COMENTO VISIT DO CAPYBARA PARA INTERAGIR COM A PAGINA, E A SUITE QUE ESTA
COM A ESTRUTURA DO RSPEC, QUE INCLUSIVE É O RSPEC QUE EXECUTA O TESTE

  Arquivo de teste final para o exemplo:
    describe "Meu primeiro script" do
      it "visitar a página" do
        visit "https://training-wheels-protocol.herokuapp.com"
        expect(page.title).to eql "Training Wheels Protocol"
      end
    end
  No script: o visit, page.title, são comandos que o capybara passa, para a intereção com o browser
           : o it, expect, .to eql, são comandos do rspec de validação e extutura 
 3.6. Para executar o teste com FIREFOX. o arquivo spec_helper deve ser alterado:
  Capybara.configure do |config|
    #config.default_driver = :selenium_chrome -> Testar com CHROME
    #config.default_driver = :selenium -> Testar com FIREFOX
    config.default_driver = :selenium
  end          
      
  Ao tentar executar, caso não tenha o FIREFOX instalado no pc, apresentará o erro:

  Meu primeiro script                                                                       
  visitar a página (FAILED - 1)                                                           
                                                                                          
    Failures:                                                                                 
                                                                                          
      1) Meu primeiro script visitar a página                                                 
      Failure/Error: visit "https://training-wheels-protocol.herokuapp.com"                
                                                                                          
      Selenium::WebDriver::Error::WebDriverError:                                          
       Could not find Firefox binary (os=windows). Make sure Firefox is installed or set t
      he path manually with Selenium::WebDriver::Firefox::Binary.path=                          
      # ./spec/hello_spec.rb:3:in `block (2 levels) in <top (required)>'                   

  Você deve instalar o Firefox.
    o arquivo deve ser salvo no C:\windows geckodriver-v0.29.1-win64

3.7 Teste com formulários:
: describe 'Forms' do     
    it 'Login com sucesso'do
        visit 'https://training-wheels-protocol.herokuapp.com/login'

        fill_in 'username', with: 'stark'
        fill_in 'password', with: 'jarvis!'

        click_button 'Login'

        expect(find('#flash').visible?).to be true

        #expect(find('#flash').text).to eql 'Olá, Tony Stark. Você acessou a área logada!'

        expect(find('#flash').text).to include 'Olá, Tony Stark. Você acessou a área logada!'

        expect(find('#flash')).to have_content 'Olá, Tony Stark. Você acessou a área logada!'
    end 
end
  NO SCRIPT ACIMA, DEFINIMOS QUE O CAPYBARA BUSCARA O SITE PELO COMANDO VISIT, TAMBEM TEMOS OS COMANDOS:
    = fill_in 'username', with: 'stark' > No campo username, inclua o valor stark
    = click_button 'Login' > clica no botão com o nome Login
    = expect(find('#flash').visible?).to be true > usa o expect do rspec para validação;
      find do capybara para encontrar o elemento, .visible? .to be true > se o elemento é visível
      .to eql > verifica se a string é igual a informada
      .to include > se o texto esta incluso no elemento
      .to have_content > se o texto esta contido no elemento

Aula - Dropdown
  Para selecionar uma opção do dropdown, o Capybara lê com essa estrutura:
   select('Opção', from: 'Elemento')
   select('item1', from: 'dropdown')
     * Para descobrir o nome do elemento, deve fazer inspecionar a página (F12)

    Caso o dropdown não tenha um id, poderemos utilizar o elementos de CSS,
    no caso usaremos o a classe do elemento, com o find:
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        drop = find('.avenger-list')
        drop.find('option', text: 'Bucky').select_option