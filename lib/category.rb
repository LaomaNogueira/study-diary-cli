CATEGORY_1 = "Ruby"
CATEGORY_2 = "Rails"
CATEGORY_3 = "HTML"

class Category
    attr_accessor :option, :name
    
    def initialize(option:)
        @option = option
        @name = name

        case option
        when 1
            self.name = CATEGORY_1
        when 2
            self.name = CATEGORY_2
        when 3
            self.name = CATEGORY_3
        else
            puts "Opção inválida! Escolha uma opção do menu."
        end
    end
end