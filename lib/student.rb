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
    DROP TABLE students (name, grade, id)
      name TEXT,
      grade TEXT,
      id INTEGER PRIMARY KEY
      )
      SQL
    DB[:conn].execute(sql)
  end
  
end
