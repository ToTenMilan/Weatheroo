require 'rails_helper'

RSpec.describe City, type: :model do
  it 'should have its attributes' do
    zion = create(:zion)
    expect(zion.uid).to equal 1
    expect(zion.name).to eq 'Zion'
    expect(zion.country).to eq 'UW'
    expect(zion.latitude).to equal 1.5
    expect(zion.longitude).to equal 1.5
  end
end
