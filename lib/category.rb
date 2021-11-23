CATEGORY_1 = "Ruby"
CATEGORY_2 = "Rails"
CATEGORY_3 = "HTML"

class Category
    attr_accessor :name
    
    def initialize()
        @name = self.category()
    end

    def category()
        puts "#1 - #{CATEGORY_1}\n#2 - #{CATEGORY_2}\n#3 - #{CATEGORY_3}"
        print "Escolha uma categoria para o seu item de estudo: "
        option = gets.to_i()

        case option
        when 1
            self.name = CATEGORY_1
        when 2
            self.name = CATEGORY_2
        when 3
            self.name = CATEGORY_3
        else
            puts "Opção inválida!."
            category();
        end
    end
end