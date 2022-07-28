require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom)
    super(name, age, parent_permission: true)
    @classroom = classroom
    classroom.add_student(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end
end
