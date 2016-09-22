class Student
  attr_accessor :name

  def initialize(n, g)
    @name = n
    @grade = g
  end

  def better_grade_than?(other_student)
    get_grade > other_student.get_grade
  end

  protected
  
  def get_grade
    @grade
  end
end

bob = Student.new("Bob", 3.2)
#puts bob.get_grade
charlie = Student.new("Charlie", 3.4)

puts "Well done." if charlie.better_grade_than?(bob)