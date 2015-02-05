# @id   - Integer
# @name - String

# to make an object display a single row of student table

# Code will be
#andrew = Student.new({id: 1, :name "Andrew"})
#beth = Student.new({id: 2, name: "Beth"})

class Student
  def initialize(options)
    # @id = options[:id]        #commented this b/c now we are using PRIMARY KEY
    @name = options[:name]
    save
  end


  # 'save' is a method that you run on an instance of a Student class
  def save
    # If you were doing from the command line:
    # INSERT INTO students (name) VALUES ('Andrew');
    #Run in terminal Question.all
    
    # YOU MUST USE SINGLE QUOTES AROUND THE STRING INTERPOLATION:
    DATABASE.execute("INSERT INTO students (name) VALUES ('#{@name}')")
    @id = DATABASE.last_insert_row_id     # will return the value of the row id
  end

  def questions
    DATABASE.execute("SELECT * FROM question WHERE student_id = #{@id}")
  end


  # class method (set as class method by naming it self.____ to show that it is 
  # executed on the entire class, not just an INSTANCE of the class)
  def self.all
    # SELECT * FROM students;
    DATABASE.execute("SELECT * FROM students")
  end

end


# class method is run on the class itself (not an instance of a class)
# like .new (run on the class itself) like Student.new

# you might want your own class methods if you want to run something on 
# every object of the student class (or the whole student table)

