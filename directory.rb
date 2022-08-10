
#firstly we puts the list of students, new line after each due to method.
#alternative is for us to use puts ("string") but we don't need to
@students = []
@@cohorts = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"]

def input_students
  require 'date'
  puts "Please type the names of the students".center(100, "*")
  puts "To finish, just hit return twice".center(100, "*")

  name = gets.strip
  @cohorts = ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"]

  while !name.empty? do
    puts "What cohort are you in? Type the month.".center(100, "*")
    cohort = gets.strip.capitalize
    until @cohorts.include?(cohort)
      puts "What cohort are you in? Type the month.".center(100, "*")
      cohort = gets.strip.capitalize
      if cohort.empty?
        cohort = Date.today.strftime("%B")
        break
      end
    end
    puts "#{name} is in the #{cohort} cohort".center(100, "*")
    puts "And their favourite hobby?".center(100, "*")
    hobby = gets.strip
    puts "#{name}'s favourite hobby is #{hobby}".center(100, "*")
    puts "Where were they born?".center(100, "*")
    country = gets.strip
    puts "#{name} was born in #{country}".center(100, "*")
    puts "And how tall are they in cm?".center(100, "*")
    height = gets.strip
    puts "#{name} is #{height}cm tall".center(100, "*")
    @students << {name: name, cohort: cohort.to_sym, hobby: hobby, country: country, height: height}
    if @students.count != 1
      puts "Now we have #{@students.count} students".center(100, "*")
    else
      puts "Now we have #{@students.count} student".center(100, "*")
    end
    puts "Please type the names of the students".center(100, "*")
    puts "To finish, just hit return twice.".center(100, "*")
    name = gets.strip
  end

  @students

end
    
def print_header
  puts "The students of Villains Academy".center(100, "*")
  puts "-------------".center(100, "*")
end

def print_students
  counter = 0
  until counter == 12
    @students.each do |student|
      puts "#{student[:name]}, #{student[:cohort]}".center(100, "*") unless student[:cohort] != @cohorts[counter].to_sym
    end
    counter += 1
  end
end

def print_footer
#then we print these three lines with no new line. If using \n as new line, use double quotes
  if @students.count != 1
    puts "Overall, we have #{@students.count} great students".center(100, "*")
  else
    puts "Overall, we have #{@students.count} great student".center(100, "*")
  end
end

def specific_letter
  @students.each_with_index do |student, index|
    if student[:name][0].upcase == "A"
      puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)".center(100, "*")
    end
  end
end

def letter_count
  @students.each_with_index do |student, index|
    if student[:name].length <= 12
      puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)".center(100, "*")
    end
  end
end

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "9. Exit"
end

def show_students
  if @students.count < 1
    puts "No students to print!".center(100, "*")
  else
    print_header
    print_students
    print_footer
  end
end

def interactive_menu
  loop do
  print_menu
    selection = gets.chomp
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "9"
        exit
      else
        puts "I don't know what you meant! Try again"
    end
  end
end

interactive_menu