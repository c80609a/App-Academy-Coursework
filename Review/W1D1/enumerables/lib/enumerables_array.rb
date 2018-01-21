def factors(num)
    resArr = [1];
    (2..num).each do |factor|
        if num % factor == 0
            resArr << factor
        end
    end
    resArr
end

def subwords(word, dict)
    substrings(word).select do |str|
        dict.include?(str)
    end
end

def substrings(word)
    subs = []
    word.length.times do |sub_start|
        (sub_start...word.length).each do |sub_end|
            sub = word[sub_start..sub_end]
            subs << sub unless subs.include?(sub)
        end
    end
    subs
end

def doubler(arr)
    arr.map { |num| num * 2 }
end
class Array 
    def bubble_sort!(&prc)
        prc = prc || Proc.new { |el1, el2| el1 <=> el2 }
        return self if count < 2
        sorted = false
        while !sorted
            sorted = true
            each_index do |i|
                next if i + 1 == length
                j = i + 1
                if prc.call(self[i], self[j]) > 0
                    sorted = false
                    self[i], self[j] = self[j], self[i] 
                end 
            end
        end
        self
    end

    def bubble_sort
        self.dup.bubble_sort!
    end

    def my_each(&prc)
        self.length.times do |i|
            prc.call(self[i])
        end
        self
    end

    def my_map(&prc)
        resArr = []
        # self.length.times do |i|
        #     resArr << prc.call(self[i])
        # end
        my_each { |el| resArr << prc.call(el) }
        resArr
    end

    def my_select(&prc)
        resArr = []
        self.length.times do |i|
            resArr << self[i] if prc.call(self[i])
        end
        resArr
    end

    def my_inject(&prc)
        val = self.first
        self.drop(1).my_each { |el| val = prc.call(val, el) }
        val
    end
end

def concatenate(arr)
    arr.inject("") do |total, string|
        total + string
    end
end