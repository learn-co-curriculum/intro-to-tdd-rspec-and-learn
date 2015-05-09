# Ignore the code in this file!

class CLIReadme

  def run
    system("clear")
    puts "Welcome to your Ruby Basics Todo!"
    puts "---------------------------------"
    puts "Press enter to continue..."
    input = gets
    self.directions.each do |direction|
      puts direction
      input = gets
    end

    puts "8. Now, type 'learn' to run the tests. Read the output of the failures and how they correspond to code located in spec/ruby_basics_spec.rb and start trying to fix them, one by one. When you make a meaningful change, just re-run the tests with the learn command."
    rspec = gets.chomp
    while rspec != 'learn'
      puts "Type 'learn'..."
      rspec = gets.chomp
    end

    system("learn")
  end

  def directions
    [
      "1. For this todo, you're going to be reviewing the basics of the Ruby language. 
          To move on from one step to the next, press Enter. Go ahead, try it now...",
      "2. We're going to be putting a big focus on test driven development. We'll cover
          it a bunch more later, but in essence, this
          means that we write tests for our code before actually writing any code.",
      "3. With that in mind, we'll be discovering the basics of Ruby through the use
          of tests.",
      "4. The tests are written in the RSpec framework and we run them through the learn command, watching them fail, and
          then making them pass. It's going to be a ton of fun!",
      "5. Usually you'll make the tests pass by actually writing code, but in this case
          you'll be exploring Ruby by altering the tests themselves.",
      "6. We'll run the tests, see a huge explosion of errors, go fix one of the errors,
          run the tests again, see slightly less errors and repeat.",
      "7. Open spec/ruby_basics_spec.rb, then come back here."
    ]
  end

end

readme = CLIReadme.new
readme.run
