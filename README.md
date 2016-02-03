## Intro to TDD, RSpec, and Learn

## Objectives

1. Define the purpose of a code test.
2. Read the RSpec tests.
3. Run tests via the `learn` command.
4. Understand test output.
5. Write code to make test pass.

### What's a Test?

Tests verify that the code you write behaves and produces the desired result. Many of the labs you will complete on Learn use tests. It can feel like an abstract concept at first, but it's worth starting to understand. Doing so will help you be more productive on Learn. Beyond that, understanding testing is important because **test-driven development**, or TDD, is considered the most reliable methodology for delivering quality code.

#### What is TDD?

Test-driven development is a big topic and you're not going to be writing your own tests for a while. It is an important concept though, so we'll touch on it briefly here. 

The basic idea behind TDD is that you should think about what you want your program to do and how you want your code to behave *before* you start coding. Especially as you begin to write more complex programs or develop applications, bringing this mindfulness to your development process will help you to write code that is robust (doesn't break all the time), flexible (accommodates future change and growth) and is easy for other developers to understand. 

#### How Does TDD Work?

Once again, you won't be writing your own tests for a while, so we'll only touch on this process briefly. Conceptually, TDD is simple:

* First, write the test for a specific function of your code. 
* *Then*, write the code to make the test pass. 

Let's walk through an example together.

### Writing a Test

#### Identifying the Desired Behavior

Before we can write any tests, we need to think about what our program needs to do. In other words, what is the desired behavior of our code? 

Let's say you run a popular social networking site. We'll call it MyFace, a name inspired by nothing in particular. 

Your users will fill out their profile information with what year they were born. You will subsequently need to display how old they are on their profile page.

We could conceive of needing to write a method `current_age_for_birth_year` to accomplish this task. 

Our method will need to take in the user's birth year, subtract that from the current year, and return the user's age. 

If the year is currently 2016 and I was born in 1984, when I call the method `current_age_for_birth_year` and provide it my birth year, 1984, by passing that year as an argument, `current_age_for_birth_year(1984)`, I expect it to return `32`. 

*Expressing that narrative in code is called a test!* 

#### Coding Our Test

In an ideal world, I could code this requirement with something like:

```
I expect the method current_age_for_birth_year(1984) to return 32
```

Unfortunately, we don't live in an ideal world. Fortunately, we have the RSpec Testing Framework.

The [RSpec Testing Framework](http://rspec.info/) is a ruby library designed to allow programmers to describe the behavior and outcomes of their programs in a very natural language similar to the above example. Lots of Ruby and Ruby on Rails labs on Learn include RSpec tests. 

Let's learn a bit about RSpec.

#### Understanding the Test in the `spec` Directory

If you haven't already, fork this lab and clone it down onto your machine. 

** Remember, at this point all we want you to be able to do is understand testing at a high level. The idea is that labs come with expectations for how your code should behave and you write the code to make those tests pass. **

Let's take a peek inside:

`spec/current_age_for_birth_year_spec.rb`

All of our tests are located within the `spec` directory. The code within the `spec` directory is already designed to test that your code works. For now, you rarely need to change any code within the `spec` directory.

Our actual code, our programs, our solutions to the challenges in the lab, the stuff that makes our tests pass, are all coded outside of the `spec` directory, generally in the root of the lab directory or in files in directories like `lib` or `app`.

In this lab, our tests are in:

 `spec/current_age_for_birth_year_spec.rb` 
 
and our actual program and solution will be in a file:

`current_age_for_birth_year.rb`.

When we run our test program, `spec/current_age_for_birth_year_spec.rb`, that code will load the code in `current_age_for_birth_year.rb` and try to execute `current_age_for_birth_year(1984)` with the expectation that it returns `32`. If so, the test will pass. Anything else will make it fail.

File: `spec/current_age_for_birth_year_spec.rb`

```ruby
require_relative '../current_age_for_birth_year.rb'

describe "current_age_for_birth_year method" do
  it "returns the age of a person based on the year of birth" do
    age_of_person = current_age_for_birth_year(1984)
    
    expect(age_of_person).to eq(32)
  end
end
```

Let's break this code down.

**How your test loads your program:**

The first line of the test:

`require_relative '../current_age_for_birth_year.rb'`

loads the code from our actual program file so that we can use all the code in that file in our test. That line connects our test to our actual program. 

**The `describe` method in RSpec:**

The next line: 

`describe "current_age_for_birth_year method" do` 

is the RSpec language and can basically be ignored for now beyond the actual semantics and meaning. We are simply saying, via valid Ruby, that this test describes the `current_age_for_birth_year` method. 

The only things that are required in this line of code are the `describe` RSpec method and the Ruby `do` keyword, the rest of this line is entirely arbitrary and of our own design. After all, `current_age_for_birth_year method` is a String of data and could not possibly matter to Ruby because it is not interpreted, it's just data.

When we write tests we use the `describe` RSpec method and strings to describe what we are testing. This code is entirely for you, the programmer, and has very little meaning to RSpec or Ruby.

**The `it` method in Rspec:**

After describing the subject of our test, the method `current_age_for_birth_year`, we use the RSpec method `it` to state an expectation or behavior of that method. 

* `it "returns the age of a person based on their year of birth" do` is very similar to the `describe` line. 

* `it` is an RSpec method

* `do` is a Ruby keyword

`"returns the age of a person based on the year of birth"` is a Ruby string that has no meaning to the code and is only there to provide you, the programmer, with a description of what behavior we're currently testing.

**Testing our method:**

The next three lines are our actual test code and the most important part of the `spec/current_age_for_birth_year_spec.rb` file. It is within this block of code––between `it` and `end`––that we test the functionality of our method.

In order to actually test our code, we need to use the method that this test relies on, that this test is designed to exercise. So the first real line of code in our test is: 

`age_of_person = current_age_for_birth_year(1984)`

What we're doing here is calling a method, `current_age_for_birth_year(1984)`, the very method we're supposed to define and implement, passing it a known argument, `1984`, and assigning the return value of the method to a variable called `age_of_person`. 

What do you think the value of `age_of_person` should be if the method `current_age_for_birth_year` is called with `1984` as the argument?

The next line of code poses that exact question with an expected outcome. Using lots of RSpec methods and syntax, we say, quite colloquially: 

`expect(age_of_person).to eq(32)`

What this line of code means is that we `expect` the value of the variable `age_of_person` to equal `32`. 

That is to say, given that `age_of_person` is the return value of the method `current_age_for_birth_year(1984)`, we can expect that the variable equals `32`, the age of the person born in 1984. That's a test.

Our test loads our code, uses our code in the manner desired, and compares the result of our code with a known outcome so that we know our code behaves as we expected.

We could imagine another specification of the `current_age_for_birth_year` method as another `it` block within the opening `describe` block:

```ruby
it "should return the current year for a person born in year 0" do
  twenty_sixteen = current_age_for_birth_year(0)

  expect(twenty_sixteen).to eq(2016)
end
```

**A test is always going to be about setting up a state with a known result and comparing that known result or expectation to the behavior of your program, thus ensuring that your program behaves as you expected.**

There are many kinds of tests, and test-driven development and RSpec are very complex topics. Just focus on the semantics and meaning of the `*_spec.rb` files for now. It's a tremendously valuable skill to be introduced to this early.

### Running Our Tests

Now that we can read our test code in our `*_spec.rb` file, let's actually run the tests. We're going to execute our test program, which is going to load our real program; try to use it in a certain manner we defined in our tests and report on the results. To do all this, simply run the `learn` command in your terminal.

The `learn` command loads RSpec to run the tests. RSpec will automatically look in a directory called `spec` and try to execute all files ending in `_spec.rb`. So you type in `learn`, RSpec is loaded, RSpec finds the file `spec/current_age_for_birth_year_spec.rb`, and it executes that code.  

RSpec is just Ruby, so everything in our test file `spec/current_age_for_birth_year_spec.rb` must be valid Ruby.

So, once again, to run your tests, go into your terminal and type `learn` in this lab's directory.

#### Understanding Test Output

When you run the tests with the `learn` command you're going to see the results of the test in your console. RSpec will report on what is working and what is broken and why. 

When you run this lab's test suite with `learn`, before writing any solution code in `current_age_for_birth_year.rb`, you'll see output similar to:

```bash
current_age_for_birth_year method
  returns the age of a person based on the year of birth (FAILED - 1)

Failures:

  1) current_age_for_birth_year method returns the age of a person based on the year of birth
     Failure/Error: age_of_person = current_age_for_birth_year(1984)
     NoMethodError:
       undefined method `current_age_for_birth_year' for #<RSpec::ExampleGroups::CurrentAgeForBirthYearMethod:0x007fbb8b0607b8>
     # ./spec/current_age_for_birth_year_spec.rb:5:in `block (2 levels) in <top (required)>'

Finished in 0.00063 seconds (files took 0.1535 seconds to load)
1 example, 1 failure

Failed examples:

rspec ./spec/current_age_for_birth_year_spec.rb:4 # current_age_for_birth_year method returns the age of a person based on the year of birth
```

Let's break this down.

```bash
current_age_for_birth_year method
  returns the age of a person based on the year of birth (FAILED - 1)
```

Those lines are summaries of what we are testing and what failed. They correspond directly to the strings provided to `describe` and `it`, and they are simply there to provide context.

```bash
  1) current_age_for_birth_year method returns the age of a person based on the year of birth
     Failure/Error: age_of_person = current_age_for_birth_year(1984)
     NoMethodError:
       undefined method `current_age_for_birth_year' for #<RSpec::ExampleGroups::CurrentAgeForBirthYearMethod:0x007fbb8b0607b8>
     # ./spec/current_age_for_birth_year_spec.rb:5:in `block (2 levels) in <top (required)>'
```

This actually describes why our test failed. 

```bash
  1) current_age_for_birth_year method returns the age of a person based on the year of birth
```

That line just joins the strings passed to `describe` and `it` to create a description of what broke.

```bash
     Failure/Error: age_of_person = current_age_for_birth_year(1984)
```

#### `NoMethodError:`

The above line raises the line of code in our test suite that created the failure and error. The rest of the output describes the error:

```bash
     NoMethodError:
       undefined method `current_age_for_birth_year' for #<RSpec::ExampleGroups::CurrentAgeForBirthYearMethod:0x007fbb8b0607b8>
     # ./spec/current_age_for_birth_year_spec.rb:5:in `block (2 levels) in <top (required)>'
```

Before writing any code, our test suite is failing because of a line of code within it: 

`age_of_person = current_age_for_birth_year(1984)`. 

This line tried calling a method, `current_age_for_birth_year`, which your test expected to have been defined. You have yet to define it, however, resulting in a `NoMethodError`.

**Tip:** We can run our test suite as many times as we want, it's totally free. In fact, we suggest that every time you make a change to your code and think it might solve something in the test, run the test suite again. Run the test suite a lot. Get instant feedback. Read the errors; they are clues. 

It's totally cool to have errors--a big part of programming is simply getting past the current error your test suite raises and getting to a new error. Progressing through errors until your tests pass is a very normal development cycle.

### Reading Errors And Making Our Tests Pass

So, we conceptually understand what we're trying to build: a method called `current_age_for_birth_year`, that when given an argument of a year of birth, `current_age_for_birth_year(1984)`, returns the age of a person, `32`. Our test suite actually tries to execute this code and compares the result of it to the desired outcome, failing until the expectation and the outcome are equal.

The first error thrown by the test suite is that our code, defined in `current_age_for_birth_year.rb`, should have defined a method called `current_age_for_birth_year`, but did not, resulting in a `NoMethodError`.

Let's fix this error by defining a method in `current_age_for_birth_year.rb` called `current_age_for_birth_year`.

Add the following to the file, `current_age_for_birth_year.rb`:

```ruby
def current_age_for_birth_year
end
```

Save the file and go back to your terminal and run the `learn` command. You'll see output including:

```bash
  1) current_age_for_birth_year method returns the age of a person based on the year of birth
     Failure/Error: age_of_person = current_age_for_birth_year(1984)
     ArgumentError:
       wrong number of arguments (1 for 0)
     # ./current_age_for_birth_year.rb:1:in `current_age_for_birth_year'
     # ./spec/current_age_for_birth_year_spec.rb:5:in `block (2 levels) in <top (required)>'
```

#### `ArgumentError:`

Our tests are still failing, but for a new reason. Previously we lacked the method definition. Now we have the method defined; however, our tests are complaining that the line of code, `age_of_person = current_age_for_birth_year(1984)`, invoked the method `current_age_for_birth_year` incorrectly because it called that method with an argument but the method *we* defined does not accept an argument. 

This results in an `ArgumentError`.

Let's fix that.

Update the code in `current_age_for_birth_year.rb` to entirely read:

```ruby
def current_age_for_birth_year(birth_year)
end
```

There we define the method `current_age_for_birth_year` to accept an argument and name that argument `birth_year`. The method does nothing else.

Run `learn` again and your failures should resemble:

```
  1) current_age_for_birth_year method returns the age of a person based on the year of birth
     Failure/Error: expect(age_of_person).to eq(32)
       
       expected: 32
            got: nil
       
       (compared using ==)
     # ./spec/current_age_for_birth_year_spec.rb:6:in `block (2 levels) in <top (required)>'
```

This failure isn't a syntax error related to undefined methods or arguments. Instead, this error is telling us that we expected the return value of the method `current_age_for_birth_year(1984)`, stored in the variable `age_of_person` to equal 32, but in actuality, the method returned the value `nil`.

That's perfect. Our test is showing a **mismatched expectation**. We need to add actual logic to that method to solve the problem.

How do we calculate the difference between the year currently and the year provided to the method as an argument `birth_year`? You might simply subtract the current year from the birth year.

```ruby
def current_age_for_birth_year(birth_year)
  2016 - birth_year
end
```

Run `learn` again and you should see the test suite passing. Great job!

At this point, you can submit your solution with `learn submit`

After you finish, here's some more to think about:

### Coding for the Future

If we stop and think about what we've done, two weird things might occur to you:

#### What does our program actually do?

First, while our tests pass, if we were to run just our program file alone, `ruby current_age_for_birth_year.rb`, it seemingly does nothing. You run that command in your shell and you get no output. What sort of program is this file `current_age_for_birth_year.rb` if it does nothing when you run it? What value does it provide?

Files and programs like the code in `current_age_for_birth_year.rb` are common and valuable. That file isn't meant to be useful alone. Rather, that file is considered a library. It's a unit of code that just defines a functionality or method that is meant to be loaded and used in more complex programs.

For example, your MyFace application, which displays a profile of a person, might require or load this simple program and use the defined method to display the person's age.

It isn't that the file `current_age_for_birth_year.rb` doesn't do anything. It does something very significant, it defines a method, it creates a unit of work that any other Ruby program that loads or requires this file can use. We do this all the time with programs, to make complex programs simple, we break up the functionalities into separate pieces and files that are smaller and easier to manage, edit, and understand.

#### Abstraction and Encapsulation

If you want to see this technique in practice, try this for fun.

Go back to your terminal. In the top level of the directory for this lab, make a new file called `how_old_are_you.rb` with the command `touch how_old_are_you.rb`. In that file, put the following code and save it:

```ruby
require_relative './current_age_for_birth_year.rb'

puts "What year were you born?"
birth_year = gets.to_i

users_age = current_age_for_birth_year(birth_year)

puts "You are: " + users_age.to_s + " years old."
```

Run this program with `ruby how_old_are_you.rb`. There shouldn't be any errors if you copied all the code from the tutorial but if there are, just read them and try to debug them or ask for help on Learn.

What this program does is load the code in our original program `current_age_for_birth_year.rb`. It then prints the string `"What year were you born?"`. It prompts the user for input via the `gets` method and converts the input to an integer with `to_i`.

The program then invokes (or calls) the method `current_age_for_birth_year`. The cool part is that this method is not defined within this file, rather, it was defined in a singular, simple file, and just loaded and used in this more complex program. That's the heart of abstraction and encapsulation: `how_old_are_you.rb` doesn't need to know how `current_age_for_birth_year.rb` works, it just gets to load the code and trusts that it behaves as expected, as it was defined in the tests for that library.

This is the architecture of real applications. Each file is a singular, simple component or "unit of work". The files are loaded together by an execution file and the discrete units execute together to make complex and amazing applications.

#### Our Tests Are Only Temporarily Correct

The second weird thing about the current implementation is that the test suite and our solution are brittle and can produce a false positive. In a year, our code will break but our tests will still pass. As long as we are relying on hard coded notions of the current year, our code and tests aren't honest. Imagine the following test, making use of Ruby's `Time` class and methods.

File: `spec/current_age_for_birth_year_spec.rb`

```ruby 
require_relative '../current_age_for_birth_year.rb'

describe "current_age_for_birth_year method" do
  it "returns the age of a person based on the year of birth" do
    current_year = Time.now.year
    birth_year = 1984
    answer = current_year - birth_year

    age_of_person = current_age_for_birth_year(birth_year)
    expect(age_of_person).to eq(answer)
  end
end
```

That test would use the year at the moment the test was executed to compute the accurate result and compare it to the result of the method.

To make that pass you would have to implement your solution in `current_age_for_birth_year.rb` as:

```ruby
def current_age_for_birth_year(birth_year)
  Time.now.year - birth_year
end
```

That would be a better implementation of `current_age_for_birth_year` as it is more abstract.

## Conclusion

Remember, for now, you are not being asked to write your own tests. The important take away here is how to *read* tests and understand error messages that get outputted as a result of running them. You can refer back to earlier lessons (see below) to review those skills. 

## Resources

<a href='https://learn.co/lessons/intro-to-tdd-rspec-and-learn' data-visibility='hidden'>View this lesson on Learn.co</a>

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/intro-to-tdd-rspec-and-learn'>TDD, Rspec, and Learn </a> on Learn.co and start learning to code for free.</p>
