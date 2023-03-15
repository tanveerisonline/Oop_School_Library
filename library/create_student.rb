require_relative 'student'
require_relative 'validation'

class CreateStudent
  include Validation
  def create_student(people)
    @people = people
    age = validate_number('Age: ')

    print 'Name: '
    name = gets.chomp.strip

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.strip.upcase
    case parent_permission
    when 'Y'
      parent_permission = true
    when 'N'
      parent_permission = false
    end
    @people << Student.new(age, name: name, parent_permission: parent_permission)
  end
end
