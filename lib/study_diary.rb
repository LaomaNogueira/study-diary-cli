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
  study_item = StudyItem.new(title: title)
  puts "Item #{study_item.title} da categoria #{study_item.category} cadastrado com sucesso!"
  study_item
end

def find_by_word(word)
  quantity_items = 0
  found_items = []

  @items.each_with_index do |item, index|
    if item.title.downcase.include?(word.downcase)
      found_items << "##{index} - #{item.title} - #{item.category}"
      quantity_items += 1
    end
  end

  if quantity_items == 1
    puts "Foi encontrado #{quantity_items} item:\n"
  elsif quantity_items > 1
    puts "Foram encontrados #{quantity_items} itens:"
  else
    puts "Nenhum item encontrado com o termo: #{word}"
  end
  
  found_items.each { |item| puts item}
end

puts "Bem-vindo ao Diário de Estudos, seu companheiro para estudar!"
option = menu()
@items = []

loop do

  case option
  when REGISTER_ITEM
    @items << register_item()
  when FIND_ALL_ITEMS
    @items.each do |item|
      puts "#{item.title} - #{item.category}"
    end
  when FIND_WORD
    puts "Digite uma palavra para procurar:"
    word = gets.chomp()
    find_by_word(word)
  when EXIT
    break
  else
    puts "Opção inválida! Escolha uma opção do menu."
  end

  option = menu()
end