describe 'Caixa de seleção', :dropdown do
    
    it 'Item especifico simples' do
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        select('Loki', from: 'dropdown')
        sleep 3 #temporários
    end

    it 'Item especifico com o find' do
        
        visit 'https://training-wheels-protocol.herokuapp.com/dropdown'
        drop = find('.avenger-list')
        drop.find('option', text: 'Bucky').select_option
        sleep 2

    end

end