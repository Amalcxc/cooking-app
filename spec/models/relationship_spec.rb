require 'rails_helper'

RSpec.describe Relationship, type: :model do
  it 'makes one user follow another' do
    user1 = User.create(name: 'valid3', username: 'valid@3', email: 'valid@3', password: 'valid3',
                        password_confirmation: 'valid3')
    user2 = User.create(name: 'valid4', username: 'valid@4', email: 'valid@4', password: 'valid4',
                        password_confirmation: 'valid4')

    user1.followers.create(followed: user2)
    expect { user1.followers.create(followed: user2) }
  end

  it 'successfully unfollow a user' do
    user1 = User.create(name: 'valid3', username: 'valid@3', email: 'valid@3', password: 'valid3',
                        password_confirmation: 'valid3')
    user2 = User.create(name: 'valid4', username: 'valid@4', email: 'valid@4', password: 'valid4',
                        password_confirmation: 'valid4')

    follow = user1.followers.create(followed: user2)
    expect { follow.destroy }
  end
end
