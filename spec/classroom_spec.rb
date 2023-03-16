require_relative '../classroom'
require_relative '../student'

describe Classroom do
  let(:classroom) { Classroom.new('A1') }
  let(:student) { Student.new('John', 'Doe', 'john.doe@example.com', '12345') }

  describe '#initialize' do
    it 'should set the classroom label' do
      expect(classroom.label).to eq 'A1'
    end

    it 'should initialize an empty list of students' do
      expect(classroom.students).to be_empty
    end
  end

  describe '#add_student' do
    it 'should add a student to the classroom' do
      classroom.add_student(student)
      expect(classroom.students).to include(student)
    end

    it 'should set the student classroom to the current classroom' do
      classroom.add_student(student)
      expect(student.classroom).to eq classroom
    end
  end
end
