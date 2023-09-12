require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    User.create!(
      name: 'Jane Doe',
      email: 'janedoe@yahoo.com',
      password: '123456'
    )
  end

  before { subject.save }

  it 'validates presence of name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  it 'validates presence of email' do
    subject.email = nil
    expect(subject).not_to be_valid
  end
end
