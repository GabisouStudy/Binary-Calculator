class Conversor
	def DecToBin(enterNumber)
		decNumber = enterNumber.to_i
		result = ""
		while decNumber >= 2
			result = (decNumber % 2).to_s  + result.to_s
			decNumber /= 2
		end
		return decNumber.to_s + result.to_s
	end

	def BinToDec(enterNumber)
		bits = enterNumber.to_s.split(//).reverse
		result = 0
		bits.each_with_index do |bit, i|
			result += 2**i.to_i*bit.to_i
		end
		return result
	end

	def DecToHexDec(enterNumber)
		decNumber = enterNumber.to_i
		result = ""
		while decNumber >= 16
			result = (decNumber % 16).to_s  + result.to_s
			if result.to_i > 9
				hdLetters = ["A","B","C","D","E","F"]
				result = hdLetters[result[1].to_i]
			end
			decNumber /= 16
		end
		if decNumber > 9
			hdLetters = ["A","B","C","D","E","F"]
			decNumber = hdLetters[decNumber.to_s[1].to_i]
		end
		return decNumber.to_s + result.to_s
	end

	def HexDecToDec(enterNumber)
		hexD = enterNumber.to_s.split(//).reverse
		result = 0

		hexD.each_with_index do |hex, i|
			if hex =~/^[A-F]+$/
				hdLetters = ["A","B","C","D","E","F"]
				hex = "1" + hdLetters.index(hex).to_s
			elsif hex=~/^[a-f]+$/
				hdLetters = ["a","b","c","d","e","f"]
				hex = "1" + hdLetters.index(hex).to_s
			end
			result += 16**i.to_i*hex.to_i
		end
		return result
	end

	def BinToHexDec(enterNumber)
		bin = enterNumber.to_s.split(//).reverse

		while (bin.length  % 4) != 0
			bin << "0"
		end
		aDec = [0]
		result = ""

		bin.each_with_index do |bit, i|
			value = bit.to_i * (2 ** (i % 4))
			if value > 0
				if i > 0 and (i % 4) == 0
					aDec << value
				else
					aDec[aDec.length  - 1] = aDec[aDec.length-1] + value
				end
			end
		end
		aDec.each_with_index do |dec, i|
			if dec.to_i > 9
				hdLetters = ["A","B","C","D","E","F"]
				dec = hdLetters[dec.to_s[1].to_i]
			end
			result = dec.to_s + result.to_s
		end

		return result
	end

	def HexDecToBin(enterNumber)
		hDec = enterNumber
		#aBin = []
		bin = ""
		hDec.to_s.split(//).each_with_index do |dec, i|
			if dec =~/^[A-F]+$/
				hdLetters = ["A","B","C","D","E","F"]
				dec = "1" + hdLetters.index(dec).to_s
			elsif dec =~/^[a-f]+$/
				hdLetters = ["a","b","c","d","e","f"]
				dec = "1" + hdLetters.index(dec).to_s
			end
			result = ""
			while dec.to_i >= 2
				result = (dec.to_i % 2).to_s  + result.to_s
				dec = dec.to_i / 2
			end
			if dec.to_i > 0
				result = dec.to_s + result.to_s
			end
			if i != 0
				while result.length < 4
					result = "0" + result
				end
			end
			bin += result
		end
		return bin
	end
end

class Calculator
	def sum(value1, value2)
		carry = []
		firstValue = firstValue.split(//)
		secondValue = secondValue.split(//)

		while firstValue.length > secondValue.length
			secondValue = "0" + secondValue
		end

		while secondValue.length > firstValue.length
			firstValue = "0" + firstValue
		end

		firstValue = firstValue.reverse
		secondValue = secondValue.reverse

		puts firstValue.to_s + "	||	" + secondValue.to_s
	end

	def subtraction(value1, value2)
		
	end

	def multiplication(value1, value2)
		
	end
	def division(value1, value2)
		
	end

	def search_operation(value1, value2, operation)
		case object
			when "+"
				puts sum(value1,value2)
			when "-"
				
			when "*"
				
			when "/"
				
		end
	end
end


puts "Welcome to..."
puts "-=[Binary Conversor v0.35]=-"
puts "	by Gabriel de Souza"
puts "\nThank you for your preference!"
puts "\n\nType exit to close this application."

conversor = Conversor.new

calculator = Calculator.new

enterType = nil

typeof = nil


firstValue = nil
secondValue = nil

operation = nil

while enterType.nil?
	if firstValue != nil && secondValue != nil
		puts "\n\nPrimeiro Valor da operacao: " + firstValue.to_s
		puts "Segundo Valor da operacao: " + secondValue.to_s
		puts "\nYour operation is: " + operation

		case operation
			when "+"
				puts "\n\nYour final result is: " + "a" + "\n__________________________________________________\n__________________________________________________\n\n"
			when "-"
				puts "\n\nYour final result is: " + "b" + "\n__________________________________________________\n__________________________________________________\n\n"
			when "*"
				puts "\n\nYour final result is: " + "c" + "\n__________________________________________________\n__________________________________________________\n\n"
			when "/"
				puts "\n\nYour final result is: " + "d" + "\n__________________________________________________\n__________________________________________________\n\n"
		end

		firstValue = nil
		operation = nil
		secondValue = nil
	else
		if firstValue.nil? || operation != nil && enterType.nil?
			puts "\n\nSelect the type of the input value:"
			puts "bin || dec || hex"
		else
			puts "\nEnter a valid operation (+, -, *, /)"
		end
		enterType = gets.chomp
		if enterType != "exit"
			if firstValue.nil? || operation != nil
				case enterType
					when "bin"
						puts "\nEnter a valid value in binary"
						value = nil
						while value.nil?
							value = gets.chomp
							if value =~/^[0-1]+$/
								if firstValue.nil?
									firstValue = value
									puts "\n\nYour value is: " + value
									puts "Your value in Decimal is: " + conversor.BinToDec(value).to_s
									puts "Your value in Hexadecimal is: " + conversor.BinToHexDec(value).to_s
								elsif secondValue.nil?
									secondValue = value
									puts "Your value is: " + value
									puts "Your value in Decimal is: " + conversor.BinToDec(value).to_s
									puts "Your value in Hexadecimal is: " + conversor.BinToHexDec(value).to_s
								end
							else
								puts "\n\nPlease, enter a valid value in binary!"
								value = nil
							end
						end
					when "dec"
						puts "\nEnter a valid value in decimal"
						value = nil
						while value.nil?
							value = gets.chomp
							if value =~/^[0-9]+$/
								if firstValue.nil?
									firstValue = conversor.DecToBin(value)
									puts "\n\nYour value is: " + value
									puts "Your value in Binary is: " + conversor.DecToBin(value).to_s
									puts "Your value in Hexadecimal is: " + conversor.DecToHexDec(value).to_s
								elsif secondValue.nil?
									secondValue = conversor.DecToBin(value)
									puts "\n\nYour value is: " + value
									puts "Your value in Binary is: " + conversor.DecToBin(value).to_s
									puts "Your value in Hexadecimal is: " + conversor.DecToHexDec(value).to_s
								end
							else
								puts "\n\nPlease, enter a valid value in decimal!"
								value = nil
							end
						end
					when "hex"
						puts "\nEnter a valid value in hexadecimal"
						value = nil
						while value.nil?
							value = gets.chomp
							if value =~ /^[[:xdigit:]]+$/
								if firstValue.nil?
									firstValue = conversor.HexDecToBin(value)
									puts "\n\nYour value is: " + value
									puts "Your value in Decimal is: " + conversor.HexDecToDec(value).to_s
									puts "Your value in Binary is: " + conversor.HexDecToBin(value).to_s
								elsif secondValue.nil?
									secondValue = conversor.HexDecToBin(value)
									puts "\n\nYour value is: " + value
									puts "Your value in Decimal is: " + conversor.HexDecToDec(value).to_s
									puts "Your value in Binary is: " + conversor.HexDecToBin(value).to_s
								end
							else
								puts "\n\nPlease, enter a valid value in hexadecimal!"
								value = nil
							end
						end
					else
					puts "\n\nPlease, enter a valid type!"
					enterType = nil
				end
			else
				if enterType == "+" || enterType == "-" || enterType == "*" || enterType == "/"
					operation = enterType
					#puts "\nYour operation is: " + operation

					enterType = nil
				else
					puts "\n\nPlease, enter a valid operation!"
					enterType = nil
				end
			end
			enterType = nil
		end
	end
end