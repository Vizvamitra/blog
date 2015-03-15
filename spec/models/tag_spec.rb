require 'rails_helper'

RSpec.describe Tag, :type => :model do
  let(:tag){create(:tag)}

  describe '#count' do
    it 'is an alias to #value' do
      expect(tag.count).to eq tag.value
    end
  end

  describe '#name' do
    it 'is an alias to #_id' do
      expect(tag.name).to eq tag._id
    end
  end
end
