require_relative 'category'

class StudyItem
    attr_accessor :title, :category

    def initialize(title:, option:)
        @title = title
        @category = Category.new(option: option).name
    end

end