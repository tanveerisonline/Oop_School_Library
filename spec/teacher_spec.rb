require_relative '../teacher'

describe Teacher do
  context 'when creating a new Teacher' do
    new_teacher = Teacher.new('Biology', 35, 'Mr. Bumblebee', false)

    it 'has a specialization' do
      expect(new_teacher.specialization).to eql 'Biology'
    end

    it 'has a name' do
      expect(new_teacher.name).to eql 'Mr. Bumblebee'
    end

    it 'has an age' do
      expect(new_teacher.age).to eql 35
    end

    it 'has parent permission' do
      expect(new_teacher.parent_permission).to be false
    end

    it 'is of type Teacher' do
      expect(new_teacher.type).to eql 'Teacher'
    end

    it 'can use services' do
      expect(new_teacher.can_use_services?).to be true
    end
  end
end
