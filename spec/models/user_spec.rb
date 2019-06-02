require 'rails_helper'

RSpec.describe User, type: :model do
  it 'should have its attributes' do
    john = create(:john)
    expect(john.email).to eq 'john.doe@com.pl'
    expect(john).to respond_to :password
    expect(john).to respond_to :user_cities
    expect(john).to respond_to :cities
  end

  it 'should not be able to create user with not unique email' do
    create(:john)
    expect {
      create(:anna, email: 'john.doe@com.pl')
    }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
