class StudyItem
    attr_accessor :title, :category

    def initialize(title:, option:)
        @title = title
        @category = option
    end

end