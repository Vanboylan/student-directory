
#firstly we puts the list of students, new line after each due to method.
#alternative is for us to use puts ("string") but we don't need to
@students = []
@cohorts = ["January", "February", "March", "April", "May", "June",
    "July", "August", "September", "October", "November", "December"]

def input_students
  require 'date'
  puts "Please type the names of the students".center(100, "*")
  puts "To finish, just hit return twice".center(100, "*")

  name = STDIN.gets.strip

  while !name.empty? do
    puts "What cohort are you in? Type the month.".center(100, "*")
    cohort = STDIN.gets.strip.capitalize
    until @cohorts.include?(cohort)
      puts "What cohort are you in? Type the month.".center(100, "*")
      cohort = STDIN.gets.strip.capitalize
      if cohort.empty?
        cohort = Date.today.strftime("%B")
        break
      end
    end
    puts "#{name} is in the #{cohort} cohort".center(100, "*")
    push_students(name, cohort)
    if @students.count != 1
      puts "Now we have #{@students.count} students".center(100, "*")
    else
      puts "Now we have #{@students.count} student".center(100, "*")
    end
    puts "Please type the names of the students".center(100, "*")
    puts "To finish, just hit return twice.".center(100, "*")
    name = STDIN.gets.strip
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
  puts "3. Save students to CSV file"
  puts "4. Load students from CSV file"
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

def process(selection)
  case selection
    when "1"
      input_students
    when "2"
      show_students
    when "3"
      save_students
    when "4"
      load_students
    when "9"
      exit
    else
      puts "I don't know what you meant! Try again"
  end
end

def interactive_menu
  loop do
  print_menu
  process(STDIN.gets.strip)
  end
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    push_students(name, cohort)
  end
  file.close
  puts "Students loaded"
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts(csv_line)
  end
  file.close
  puts "File saved".center(100, "*")
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exist?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}".center(100, "*")
  else
    puts "Sorry, #{filename} does not exist"
    exit
  end
end

def push_students(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

interactive_menu