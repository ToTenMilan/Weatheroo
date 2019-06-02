require 'rails_helper'

RSpec.describe UserCity, type: :model do
  it 'should have its relationships and attributes' do
    user_city = create(:user_city)
    expect(user_city.uid).to equal 1
    expect(user_city).to respond_to :city
    expect(user_city).to respond_to :user
  end

  it 'should not be able to create record on not unique user and city combination' do
    uc = create(:user_city)
    expect { create(:user_city, uid: uc.uid + 1) }.to raise_error(ActiveRecord::RecordInvalid)
  end
end
