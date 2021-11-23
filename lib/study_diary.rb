require 'io/console'
require_relative 'study_item'
require 'json'

REGISTER_ITEM = 1
FIND_ALL_ITEMS = 2
FIND_WORD = 3
MARK_AS_DONE = 4
EXIT = 5

def welcome
  puts "Bem-vindo ao Diário de Estudos, seu companheiro para estudar!"
end

def menu
  puts <<~MENU
  ===================================
  [#{REGISTER_ITEM}] Cadastrar um item de estudo
  [#{FIND_ALL_ITEMS}] Ver todos os itens cadastrados
  [#{FIND_WORD}] Buscar um item de estudo
  [#{MARK_AS_DONE}] Marcar um item como concluído
  [#{EXIT}] Sair
  ===================================
  MENU
  print "Escolha uma opção: "
  gets.to_i
end

def clear
  system('clear')
end

def wait_keypress
  puts "Pressione qualquer tecla para continuar"
  STDIN.getch
end

def wait_and_clear
  wait_keypress
  clear
end

def register_item
  print "Digite um título para o seu item de estudo: "
  title = gets.chomp
  study_item = StudyItem.new(title: title)
  puts "Item #{study_item.title} da categoria #{study_item.category} cadastrado com sucesso!"
  study_item
end

def print_items(study_items)
  study_items.each.with_index(1) do |item, index|
    puts <<~ITEMS
    #{index} | #{item.title} | #{item.category}#{" | Finalizado!" if item.done}
    #{"Descrição: #{item.description}" if !item.description.empty?}
    ITEMS
  end
  puts "Nenhum item encontrado!" if study_items.empty?
end

def find_by_word(study_items)
  print "Digite uma palavra para procurar: "
  word = gets.chomp()
  study_items.filter_map { |item| item if item.title.downcase.include?(word.downcase) || item.description.downcase.include?(word.downcase) }
end

def mark_as_done(study_items)
  not_finalized = study_items.filter { |item| !item.done }
  print_items(not_finalized)

  print 'Digite o número do item que deseja finalizar: '
  item = gets.to_i
  not_finalized[item-1].done = true if item > 0 && item <= not_finalized.length
end

welcome()
option = menu()
items = []

loop do

  case option
  when REGISTER_ITEM
    items << register_item()
  when FIND_ALL_ITEMS
    print_items(items)
  when FIND_WORD
    found_items = find_by_word(items)
    quantity_items = found_items.length
    puts "Foi encontrado #{quantity_items} item:" if quantity_items == 1
    puts "Foram encontrados #{quantity_items} itens:" if quantity_items > 1
    print_items(found_items)
  when MARK_AS_DONE
    mark_as_done(items)
  when EXIT
    break
  else
    puts "Opção inválida! Escolha uma opção do menu."
  end

  wait_and_clear
  option = menu()
end