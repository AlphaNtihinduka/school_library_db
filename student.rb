require './person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom, age, name='unknown', parent_permission: true)
    super(name, age, parent_permission: true)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
