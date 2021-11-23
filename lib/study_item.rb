require_relative 'category'

class StudyItem
    attr_accessor :title, :category, :description, :done

    def initialize(title:)
        @title = title
        @category = Category.new().name
        @description = insert_description
        @done = false
    end

    def insert_description
        print "Digite a descrição do seu item de estudo: "
        gets.chomp
    end
     
end