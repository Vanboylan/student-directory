
#firstly we puts the list of students, new line after each due to method.
#alternative is for us to use puts ("string") but we don't need to
def input_students
  require 'date'
  puts "Please type the names of the students".center(100, "*")
  puts "To finish, just hit return twice".center(100, "*")

  students = []

  name = gets.strip
  cohorts = ["January", "February", "March", "April", "May", "June",
            "July", "August", "September", "October", "November", "December"]

  while !name.empty? do
    puts "What cohort are you in? Type the month.".center(100, "*")
    cohort = gets.strip.capitalize
    until cohorts.include?(cohort)
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
    students << {name: name, cohort: cohort.to_sym, hobby: hobby, country: country, height: height}
    if students.count != 1
      puts "Now we have #{students.count} students".center(100, "*")
    else
      puts "Now we have #{students.count} student".center(100, "*")
    end
    puts "Please type the names of the students".center(100, "*")
    puts "To finish, just hit return twice.".center(100, "*")
    name = gets.strip
  end

  students

end
    
def print_header
  puts "The students of Villains Academy".center(100, "*")
  puts "-------------".center(100, "*")
end

def print_students(students)
  if students.count < 1
    puts "No students to print!"
  else
    cohorts = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"]
    counter = 0
    until counter == 12
      students.each do |student|
        if student[:cohort] == cohorts[counter].to_sym
          puts "#{student[:name]}, #{student[:cohort]}".center(100, "*")
        end
      end
    counter += 1
    end
  end
end

def print_footer(students)
#then we print these three lines with no new line. If using \n as new line, use double quotes
  if students.count != 1
    puts "Overall, we have #{students.count} great students".center(100, "*")
  else
    puts "Overall, we have #{students.count} great student".center(100, "*")
  end
end

def specific_letter(students)
  students.each_with_index do |student, index|
    if student[:name][0].upcase == "A"
      puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)".center(100, "*")
    end
  end
end

def letter_count(students)
  students.each_with_index do |student, index|
    if student[:name].length <= 12
      puts "#{index+1} #{student[:name]} (#{student[:cohort]} cohort)".center(100, "*")
    end
  end
end

students = input_students
print_header
print_students(students)
print_footer(students)
letter_count(students)
specific_letter(students)
