# If the numbers 1 to 5 are written out in words: one, two, three, four, five, 
# then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

# If all the numbers from 1 to 1000 (one thousand) inclusive were written out 
# in words, how many letters would be used?

# NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and 
# forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 
# letters. The use of "and" when writing out numbers is in compliance with 
# British usage.

time_started = Time.now
puts "Started processing at #{time_started}."

number_hash = {
  '1'   =>  'one',
  '2'   =>  'two',
  '3'   =>  'three',
  '4'   =>  'four',
  '5'   =>  'five',
  '6'   =>  'six',
  '7'   =>  'seven',
  '8'   =>  'eight',
  '9'   =>  'nine',
  '10'  =>  'ten',
  '11'  =>  'eleven',
  '12'  =>  'twelve',
  '13'  =>  'thirteen',
  '14'  =>  'fourteen',
  '15'  =>  'fifteen',
  '16'  =>  'sixteen',
  '17'  =>  'seventeen',
  '18'  =>  'eighteen',
  '19'  =>  'nineteen',
  '20'  =>  'twenty',
  '30'  =>  'thirty',
  '40'  =>  'forty',
  '50'  =>  'fifty',
  '60'  =>  'sixty',
  '70'  =>  'seventy',
  '80'  =>  'eighty',
  '90'  =>  'ninety'
}

def convert_to_words(number, dictionary)
  words = ""

  if number > 999
    words += "#{dictionary[(number / 1000).to_i.to_s]} thousand"
    number = 0
  end

  if number > 99
    hundreds = (number / 100).to_i
    words += "#{dictionary[hundreds.to_s]} hundred"
    words += " and " unless number % 100 == 0
    number -= hundreds * 100
  end

  if number > 10
    if number <= 20
      words += dictionary[number.to_s]
      number = 0
    else
      tens = (number / 10).to_i
      words += dictionary["#{tens}0"]
      words += "-" unless number % 10 == 0
      number -= tens * 10
    end
  end

  unless number == 0
    units = number
    words += dictionary[units.to_s]
  end

  return words
end

numbers_in_words = []

1.upto(1000) do |i|
  if i <= 20
    numbers_in_words << number_hash[i.to_s]
  else
    numbers_in_words << convert_to_words(i, number_hash)
  end
end

letter_count = 0

numbers_in_words.each do |word|
  letter_count += word.gsub(/\-|\s*/, '').length
end

puts "Letter count: #{letter_count}"

time_finished = Time.now
puts "Processing complete at #{time_finished}."
puts "It took #{time_finished-time_started} seconds to complete."