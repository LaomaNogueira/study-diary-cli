require_relative 'category'

class StudyItem
    attr_accessor :title, :category

    def initialize(title:)
        @title = title
        @category = Category.new().name
    end
    
end