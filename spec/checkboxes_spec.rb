describe 'Caixas de selecao',:checkbox do

    before(:each) do #before será executado em cada cenário da suite
        visit 'https://training-wheels-protocol.herokuapp.com/checkboxes'
    end

    it 'marcando uma opcao' do
        check('thor')
    end
    
    it 'desmarcando opcao' do
        uncheck('ant-man')
        
    end

    after(:each) do
        sleep 2
    end
end