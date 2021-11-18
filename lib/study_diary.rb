require 'json'

REGISTER_ITEM = 1
FIND_ALL_ITEMS = 2  #Foi encontrado #{X} itens
FIND_WORD = 3       #Digite uma palavra para procurar:
EXIT = 4            #Obrigada por usar o diário de estudos!


def menu()
  puts "[#{REGISTER_ITEM}] Cadastrar um item para estudar"
  puts "[#{FIND_ALL_ITEMS}] Ver todos os itens cadastrados"
  puts "[#{FIND_WORD}] Buscar um item de estudo"
  puts "[#{EXIT}] Sair"
  print "Escolha uma opção: "
  gets.to_i()
end

def register_item()

end

def find_by_word()
  puts "Digite uma palavra para procurar:"
end

puts "Bem-vindo ao Diário de Estudos, seu companheiro para estudar!"
option = menu()
items = []

loop do

  case option
  when REGISTER_ITEM

  when FIND_ALL_ITEMS

  when FIND_WORD
  
  when EXIT
    break
  else
    puts "Opção inválida! Escolha uma opção do menu."
  end

  option = menu()
end