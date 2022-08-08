
#firstly we puts the list of students, new line after each due to method.
#alternative is for us to use puts ("string") but we don't need to
students = [
    "Dr. Hannibal Lecter",
    "Darth Vader",
    "Nurse Ratched",
    "Michael Corleone",
    "Alex DeLarge",
    "The Wicked Witch of the West",
    "Terminator",
    "Freddy Krueger",
    "The Joker",
    "Joffrey Baratheon",
    "Norman Bates"]

    puts "The students of Villains Academy\n-------------"
    students.each do |student|
        puts student
    end
#then we print these three lines with no new line. If using \n as new line, use double quotes
print "Overall, we have #{students.count} great students"