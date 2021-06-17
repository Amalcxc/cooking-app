require 'rails_helper'

RSpec.describe Idea, type: :model do

  it 'accepts a valid message' do
    user1 = User.create(name: 'NewUser',username:'Newuser', email: 'user@example.com', password: '1234567', password_confirmation: '1234567')
    idea1 = user1.ideas.create(idea: 'new idea created')
    expect(idea1.valid?).to eq(true)
  end

  it 'does not accept a message from without an user' do
    idea1 = Idea.create(idea: 'new idea created')
    expect(idea1.valid?).to eq(false)
  end

  it 'does not accept a empty message' do
    idea1 = Idea.create
    expect(idea1.valid?).to eq(false)
  end

  it 'destroys a idea successfully' do
    user1 = User.create(name: 'NewUser',username:'Newuser', email: 'user@example.com', password: '1234567', password_confirmation: '1234567')
    idea1 = user1.ideas.create(idea: "Idea was successfully destroyed.")

    expect { idea1.destroy }
  end
end
