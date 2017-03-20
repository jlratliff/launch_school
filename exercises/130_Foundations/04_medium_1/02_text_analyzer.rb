# 02_text_analyzer.rb
# Fill out the rest of the Ruby code below so that output similar to "Sample Output" is sent to the terminal. To get such output, read some text from a file in process and pass that text to the block provided to each call. Note that everything you need to work on is either part of the process method or part of one of the 3 blocks. No other additions or changes are required. The text you use does not have to produce the same numbers as the sample output, but should have the indicated format.

# class TextAnalyzer
#   def process
#     # your implementation
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |file| puts # your implementation }
# analyzer.process { |file| puts # your  implementation }
# analyzer.process { |file| puts # your implementation }
# Sample Output:

# 3 paragraphs
# 25 lines
# 306 words

# class TextAnalyzer
#   def process
#     yield
#   end
# end

# analyzer = TextAnalyzer.new
# analyzer.process { |file| puts "3 paragraphs" }
# analyzer.process { |file| puts "25 lines" }
# analyzer.process { |file| puts "306 words" }

class TextAnalyzer
  def process
    file = File.open('sample_text.txt', 'r')
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").count} paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").count} lines" }
analyzer.process { |text| puts "#{text.split(' ').count} words" }