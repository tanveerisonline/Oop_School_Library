require_relative '../student'
require_relative '../classroom'

describe Student do
  let(:classroom) { Classroom.new('Math') }
  let(:student) { Student.new(classroom, 16, 'John Doe', true) }

  context 'testing for Student' do
    it 'correct classroom' do
      expect(student.classroom).to eql classroom
    end

    it 'able to play hooky' do
      expect(student.play_hooky).to eql '¯(ツ)/¯'
    end

    it 'able to set the classroom' do
      new_classroom = Classroom.new('Science')
      student.classroom = new_classroom
      expect(student.classroom).to eql new_classroom
      expect(new_classroom.students.include?(student)).to be true
    end
  end
end
