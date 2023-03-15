class CreateTeacher
  include Validation
  def create_teacher(people)
    @people = people
    age = validate_number('Age: ')
    print 'Name: '
    name = gets.chomp.strip
    print 'Specialization: '
    specialization = gets.chomp.strip
    @people << Teacher.new(specialization, age, name: name)
  end
end
