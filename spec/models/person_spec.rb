require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) { Person.new }
  let(:person2) { Person.new(first_name: 'Will', last_name: 'Smith', email: 'test@test.com', phone: '+123456') }

  context 'check validation' do
    it 'should be invalid' do
      person.save

      expect(person.errors.messages[:first_name]).to eq ['can\'t be blank']
      expect(person.errors.messages[:last_name]).to eq ['can\'t be blank']
      expect(person.errors.messages[:email]).to eq ['is invalid']
      expect(person.errors.messages[:phone]).to eq ['is invalid']
    end

    it 'should be valid' do
      person.save

      expect(person2.errors.messages[:first_name]).to_not eq ['can\'t be blank']
      expect(person2.errors.messages[:last_name]).to_not eq ['can\'t be blank']
      expect(person2.errors.messages[:email]).to_not eq ['is invalid']
      expect(person2.errors.messages[:phone]).to_not eq ['is invalid']
    end
  end
end
