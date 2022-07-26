require './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization)
    @specialization = specialization
    super(name, age, parent_permission: true)
  end

  def can_use_services?
    true
  end
end
