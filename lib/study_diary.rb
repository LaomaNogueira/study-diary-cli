require_relative 'study_item'
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
  puts "Digite o título do seu item de estudo:"
  title = gets.chomp()
  puts "#1 - Ruby\n#2 - Rails\n#3 - HTML"
  puts "Escolha uma categoria para o seu item de estudo:"
  option = gets.to_i()
  study_item = StudyItem.new(title: title, option: option)
  puts "Item #{study_item.title} da categoria #{study_item.category} cadastrado com sucesso!"
  study_item
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
    items << register_item()
  when FIND_ALL_ITEMS
    items.each do |item|
      puts "#{item.title} - #{item.category}"
    end
  when FIND_WORD
  
  when EXIT
    break
  else
    puts "Opção inválida! Escolha uma opção do menu."
  end

  option = menu()
end