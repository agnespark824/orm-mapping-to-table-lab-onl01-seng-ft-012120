class Student
  attr_accessor :name, :grade
  attr_reader :id

  def initialize(name, grade, id = nil)
    @name = name
    @grade = grade
    @id = id
  end
  
  def self.create_table
    sql = <<-SQL #leading tabs are ignored
    CREATE TABLE IF NOT EXISTS students (name, grade, id)
      name TEXT,
      grade TEXT,
      id INTEGER PRIMARY KEY
      )
      SQL
   
    DB[:conn].execute(sql)
  end
  
  def self.drop_table
    sql = <<-SQL #leading tabs are ignored
    DROP TABLE students
      SQL
   
    DB[:conn].execute(sql)
  end
  
  def save
    sql = <<-SQL
    INSERT INTO students (name, grade, id)
      VALUES (?, ?, ?)
    SQL
    
    DB[:conn].execute(sql, self.name, self.grade, self.id)
  end
  
  def self.create(:name, :grade)
    student = Student.new(:name, :grade)
    student.save
    student
  end
  
end
