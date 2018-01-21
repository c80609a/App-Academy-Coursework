class Card
    def initialize(value)
        @value = value
        @facedown = true
    end

    def show
        if facedown
            ""
        else
            @value
        end
    end

    def hide
        @facedown = true
    end

    def reveal
        @facedown = false
    end

    def to_s
        @value
    end

    def ==(card)
        
    end

end