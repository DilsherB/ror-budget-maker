require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) do
    User.create!(
      name: 'Jane Doe',
      email: 'janedoe@yahoo.com',
      password: '123456'
    )
  end

  subject do
    Category.create!(
      name: 'Entertainment',
      author_id: user.id
    )
  end

  it 'validates presence of name' do
    subject.name = nil
    expect(subject).not_to be_valid
  end

  context '#format_date' do
    it 'correctly formats time_with_zone' do
      time_with_zone = Time.zone.local(2023, 8, 10, 12, 0, 0)
      formatted_date = subject.format_date(time_with_zone)

      expect(formatted_date).to eq('10 Aug 2023')
    end
  end
end
