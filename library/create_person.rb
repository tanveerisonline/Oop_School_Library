require_relative 'create_student'
require_relative 'create_teacher'
require_relative 'validation'

class CreatePerson
  include Validation
  def initialize(people)
    @people = people
  end

  def create_person
    choice = validate_options('Do you want to create a student (1) or a teacher (2)? [Input the number]: ', [1, 2])
    case choice
    when 1 then CreateStudent.new.create_student(@people)
    when 2 then CreateTeacher.new.create_teacher(@people)
    end
    puts 'Person created successfully'
  end
end
