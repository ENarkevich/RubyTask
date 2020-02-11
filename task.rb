class MyClass
attr_accessor :str, :number, :array

def initialize()
	@number = 7
	@array = [1, 2, 4, 6, 8, 7, 9, 10, 56, 99]
	@str = "one сute cat eats a fish with anotherсute  сute cat. yammy!"
end

def hf_word
	words=str.split(/[, \.?!:]+/)
	freq=Hash.new(0)
	until words.empty? do
		temp=words[0]
		n1=words.size
		words.delete(temp)	
		n2=words.size
		freq[temp]=n1-n2
	end
	res=freq.max_by{|array| array[1]}
	return freq.find_all{ |element| element[1]>=res[1]}
end

def fibonacci
    a = 0
    b = 1
    @number.times do
        temp = a
        a = b
        b = temp + b
    end
    return a
end

def even_numbers
   return @array.find_all { |element| element.to_i%2==0 }
end
end

if __FILE__ == $0
mc = MyClass.new

puts "Even numbers: #{mc.even_numbers.join(" ")}"
puts "#{mc.number} number of fibonacci sequence = #{mc.fibonacci}"
mc.hf_word.each{|element| puts "Most repeated word: #{element.join(" ")}"}

puts "Inter a number to fibonacci sequence"
mc.number=gets.chomp.to_i
puts "#{mc.number} number of fibonacci sequence = #{mc.fibonacci}"

puts "Inter array"
mc.array= gets.chomp.split(/[, \.?!:]+/)
puts "Even numbers = #{mc.even_numbers.join(" ")}"

puts "Inter string"
mc.str=gets.chomp
mc.hf_word.each{|element| puts "Most repeated word: #{element.join(" ")}"}
end
