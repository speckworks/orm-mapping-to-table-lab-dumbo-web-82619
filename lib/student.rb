class Student
  attr_accessor :name, :grade 
  attr_reader :id
  
  def initialize(name, grade)
    @name = name
    @grade = grade
    @id = id
  end
  
  def self.create_table
    sql =  <<-SQL 
      CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, 
        name TEXT, grade INTEGER)
        SQL
    DB[:conn].execute(sql)
  end
  
  def self.id
    @id
  end
  
  def save(student_name, student_grade)
    sql = <<-SQL
      INSERT INTO students (name, grade) VALUE (student_name, student_grade)
    SQL
    DB[:conn].execute(sql, self.name, self.grade, self.id)
  end
     
  # Remember, you can access your database connection anywhere in this class
  #  with DB[:conn]  
  
end
