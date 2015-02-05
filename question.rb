class Question
  def initialize(options)
    @student_id = options[:student_id]
    @question = options[:question]
  end
  
  def save
    # INSERT INTO question (student_id, question) VALUES ((#{@student_id}, '#{question}'))
    # INSERT INTO question (student_id, question) VALUES (4, "What color is the rainbow?");
    DATABASE.execute("INSERT INTO question (student_id, question) VALUES (#{@student_id}, '#{@question}')")
  end

  
  # DATABASE.execute("INSERT INTO students (name) VALUES ('#{@name}')")
  
  
  def self.all
    # SELECT * FROM question;   Run in terminal Question.all
    DATABASE.execute("SELECT * FROM question")
  end
  
  # def
  #   # SELECT * FROM question WHERE student_id = 2;
  #   DATABASE.execute("SELECT * FROM question WHERE student_id = 2")
  # end


end