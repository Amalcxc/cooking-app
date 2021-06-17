require 'rails_helper'

RSpec.describe User, type: :model do
  before :each do
    User.create(name: 'NewUser', username: 'Newuser', email: 'user@example.com', password: '1234567',
                password_confirmation: '1234567')
  end

  it 'checks the user exists' do
    expect(User.last.name).to eq('NewUser')
  end

  it 'checks the user exists' do
    expect(User.last.username).to eq('Newuser')
  end

  it 'Succeeds when you create a user with valid inputs' do
    expect(User.create(username: 'NewerUser',
                       name: 'NewerUser',
                       email: 'user@newer.com',
                       password: '123456',
                       password_confirmation: '123456')).to eq(User.find_by(name: 'NewerUser'))
  end

  it 'It fails if wrong parameters are passed' do
    user = User.create(name: '', username: '', email: '', password: '', password_confirmation: '')
    expect(user.errors.full_messages).to eq(["Email can't be blank", "Password can't be blank"])
  end

  it 'should have many ideas' do
    t = User.reflect_on_association(:ideas)
    expect(t.macro).to eq(:has_many)
  end
end
