require 'rails_helper'

RSpec.describe User, :type => :model do
  it 'has valid factory' do
    expect(build(:user)).to be_valid
  end

  describe 'validations' do
    it 'validates presence of name' do
      expect( build(:user, name: nil) ).not_to be_valid
    end
  end
end
